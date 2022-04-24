-- Explicitly set the venv for black
if vim.g.black_virtualenv == '' or  vim.g.black_virtualenv == nil then
    vim.g.black_virtualenv = vim.env.HOME .. '/.venv'
end

if vim.g.black_skip_magic_trailing_comma == '' or  vim.g.black_skip_magic_trailing_comma  == nil then
    vim.g.black_skip_magic_trailing_comma = 0
end
