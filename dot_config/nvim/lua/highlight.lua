
--[[
" https://vim.fandom.com/wiki/Highlight_current_line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
--]]

--Create or clear the CursorLine autocommand group
local cursor_line_group = vim.api.nvim_create_augroup('CursorLine', { clear = true })

-- Enable cursorline when entering buffers or windows
vim.api.nvim_create_autocmd(
    {'VimEnter', 'WinEnter', 'BufWinEnter'},
    {
        group = cursor_line_group,
        pattern = '*',
        command = 'setlocal cursorline',
    }
)

-- Disable cursorline when leaving windows
vim.api.nvim_create_autocmd(
    {'WinLeave'},
    {
        group = cursor_line_group,
        pattern = '*',
        command = 'setlocal nocursorline',
    }
)
