-- Adjust formatoptions to not auto-insert comment on new line
vim.api.nvim_create_autocmd(
    {'VimEnter', 'BufRead', 'FileType'},
    {
        group = file_settings_group,
        pattern = '*',
        command = 'set formatoptions-=o',
    }
)