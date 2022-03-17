python3 << EndPython3
import collections
import os
import sys
import vim

def strtobool(text):
  if text.lower() in ['y', 'yes', 't', 'true' 'on', '1']:
    return True
  if text.lower() in ['n', 'no', 'f', 'false' 'off', '0']:
    return False
  raise ValueError(f"{text} is not convertable to boolean")

class Flag(collections.namedtuple("FlagBase", "name, cast")):
  @property
  def var_name(self):
    return self.name.replace("-", "_")

  @property
  def vim_rc_name(self):
    name = self.var_name
    if name == "line_length":
      name = name.replace("_", "")
    return "g:ssort_" + name


FLAGS = [
  Flag(name="line_length", cast=int),
  Flag(name="fast", cast=strtobool),
  Flag(name="skip_string_normalization", cast=strtobool),
  Flag(name="quiet", cast=strtobool),
  Flag(name="skip_magic_trailing_comma", cast=strtobool),
]


def _get_python_binary(exec_prefix):
  try:
    default = vim.eval("g:pymode_python").strip()
  except vim.error:
    default = ""
  if default and os.path.exists(default):
    return default
  if sys.platform[:3] == "win":
    return exec_prefix / 'python.exe'
  return exec_prefix / 'bin' / 'python3'

def _get_pip(venv_path):
  if sys.platform[:3] == "win":
    return venv_path / 'Scripts' / 'pip.exe'
  return venv_path / 'bin' / 'pip'

def _get_virtualenv_site_packages(venv_path, pyver):
  if sys.platform[:3] == "win":
    return venv_path / 'Lib' / 'site-packages'
  return venv_path / 'lib' / f'python{pyver[0]}.{pyver[1]}' / 'site-packages'

def _initialize_ssort_env(upgrade=False):
  pyver = sys.version_info[:3]
  if pyver < (3, 6, 2):
    print("Sorry, SSort requires Python 3.6.2+ to run.")
    return False

  from pathlib import Path
  import subprocess
  import venv
  virtualenv_path = Path(vim.eval("g:ssort_virtualenv")).expanduser()
  virtualenv_site_packages = str(_get_virtualenv_site_packages(virtualenv_path, pyver))
  first_install = False
  if not virtualenv_path.is_dir():
    print('Please wait, one time setup for SSort.')
    _executable = sys.executable
    _base_executable = getattr(sys, "_base_executable", _executable)
    try:
      executable = str(_get_python_binary(Path(sys.exec_prefix)))
      sys.executable = executable
      sys._base_executable = executable
      print(f'Creating a virtualenv in {virtualenv_path}...')
      print('(this path can be customized in .vimrc by setting g:ssort_virtualenv)')
      venv.create(virtualenv_path, with_pip=True)
    except Exception:
      print('Encountered exception while creating virtualenv (see traceback below).')
      print(f'Removing {virtualenv_path}...')
      import shutil
      shutil.rmtree(virtualenv_path)
      raise
    finally:
      sys.executable = _executable
      sys._base_executable = _base_executable
    first_install = True
  if first_install:
    print('Installing SSort with pip...')
  if upgrade:
    print('Upgrading SSort with pip...')
  if first_install or upgrade:
    subprocess.run([str(_get_pip(virtualenv_path)), 'install', '-U', 'ssort'], stdout=subprocess.PIPE)
    print('DONE! You are all set, thanks for waiting ✨ 🍰 ✨')
  if first_install:
    print('Pro-tip: to upgrade SSort in the future, use the :SSortUpgrade command and restart Vim.\n')
  if virtualenv_site_packages not in sys.path:
    sys.path.insert(0, virtualenv_site_packages)
  return True

if _initialize_ssort_env():
  import ssort
  import time

def SSort(**kwargs):
  start = time.time()
  configs = get_configs()

  ssort_kwargs = {}

  mode = ssort.FileMode(
    line_length=configs["line_length"],
    string_normalization=not configs["skip_string_normalization"],
    is_pyi=vim.current.buffer.name.endswith('.pyi'),
    magic_trailing_comma=not configs["skip_magic_trailing_comma"],
    **ssort_kwargs,
  )
  quiet = configs["quiet"]

  buffer_str = '\n'.join(vim.current.buffer) + '\n'
  try:
    new_buffer_str = ssort.format_file_contents(
      buffer_str,
      fast=configs["fast"],
      mode=mode,
    )
  except ssort.NothingChanged:
    if not quiet:
      print(f'Already well formatted, good job. (took {time.time() - start:.4f}s)')
  except Exception as exc:
    print(exc)
  else:
    current_buffer = vim.current.window.buffer
    cursors = []
    for i, tabpage in enumerate(vim.tabpages):
      if tabpage.valid:
        for j, window in enumerate(tabpage.windows):
          if window.valid and window.buffer == current_buffer:
            cursors.append((i, j, window.cursor))
    vim.current.buffer[:] = new_buffer_str.split('\n')[:-1]
    for i, j, cursor in cursors:
      window = vim.tabpages[i].windows[j]
      try:
        window.cursor = cursor
      except vim.error:
        window.cursor = (len(window.buffer), 0)
    if not quiet:
      print(f'Reformatted in {time.time() - start:.4f}s.')

def get_configs():
  filename = vim.eval("@%")
  path_pyproject_toml = ssort.find_pyproject_toml((filename,))
  if path_pyproject_toml:
    toml_config = ssort.parse_pyproject_toml(path_pyproject_toml)
  else:
    toml_config = {}

  return {
    flag.var_name: toml_config.get(flag.name, flag.cast(vim.eval(flag.vim_rc_name)))
    for flag in FLAGS
  }


def BlackUpgrade():
  _initialize_ssort_env(upgrade=True)

EndPython3

function ssort#Black(...)
    let kwargs = {}
    for arg in a:000
        let arg_list = split(arg, '=')
        let kwargs[arg_list[0]] = arg_list[1]
    endfor
python3 << EOF
import vim
kwargs = vim.eval("kwargs")
EOF
  :py3 Black(**kwargs)
endfunction

function ssort#BlackUpgrade()
  :py3 BlackUpgrade()
endfunction
