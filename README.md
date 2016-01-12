nvim
====

My Neovim setup

## Major Diffs
The biggest difference between this repo and other Vim/NeoVim config repos
is the init.vim is broken out into many files. In general, each plugin has it's
own corresponding config dot vim file in the `nvimrc` directory.

## upkg

I use upkg to manage nvim, as well as my other system utilities that are GitHub repos.

### Making my nvim repo a upkg

The top directory of the nvim repo holds the package information in `_upkg` and the my nvim
files in `nvim`.

#### Setting up the `_upkg` directory.

This needs a few files to create the package. Right now `upkg` is in development, so much of the package setup is manual at this time. In the future this will be much easier to setup.

#### `_upkg` files

* `pkgs.sh` This is a bash file that has some library functions and other helpers to
assist in package writing. This should be provided by `upkg`, for now I have to copy it from
another upkg repo.

* `install` This is where you put any required scripting that will be run when the package is installed.
* `update` This is where you put any required scripting that will be run when the package is
updated.
* `remove` This is where you put any required scripting that will be run when the package is
removed.

## The nvim install

All of my nvim files are in the nvim subdirectory. This is analogous to a `/~.nvim` directory.

Instead of putting everything into one .nvimrc, I split it into a main .nvimrc file and then many sub files that live in the `nvimrc` directory.
