-- ================= Clipboard ========================
-- Check if Neovim has clipboard support and configure accordingly
if vim.fn.has('clipboard') == 1 then
  -- Set the clipboard to use the unnamed register if available
  vim.o.clipboard = 'unnamed'

  -- Additionally check for 'unnamedplus' support and append it if available
  if vim.fn.has('unnamedplus') == 1 then
    vim.o.clipboard = vim.o.clipboard .. ',unnamedplus'
  end
end
