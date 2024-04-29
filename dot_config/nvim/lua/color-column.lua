-- Define the function to set the color column based on textwidth
local function SetColorColumn()
  -- Access the current buffer's option using vim.api.nvim_buf_get_option
  local textwidth = vim.api.nvim_buf_get_option(0, 'textwidth')
  
  if textwidth == 0 then
    -- Set colorcolumn to 80 if textwidth is 0
    vim.opt.colorcolumn = '80'
  else
    -- Set colorcolumn to one column past the textwidth
    vim.opt.colorcolumn = tostring(textwidth + 1)
  end
end

-- Optionally, you can set this function to run whenever certain events occur, such as opening a new buffer
-- This is how you might automatically invoke the function
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "VimEnter", "WinEnter", "FileType"}, {
  pattern = "*",  -- Apply to all file types; adjust as necessary for specific file types
  callback = SetColorColumn,
})
