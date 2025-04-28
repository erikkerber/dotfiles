local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

require('settings')
require('setup')
require('plugs')
require('NERDTree')
require('undo')
require('highlight')
require('clipboard')
require('color-column')
require('newline-comment')
require('lsp')
require('telescope-setup')
-- require('nvim-treesitter-setup')
-- require('avante-setup')
-- require oil.nvim)

-- https://news.ycombinator.com/item?id=40838747
vim.keymap.set('n', '\\.', ':tabedit %:p:h<CR>')

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

require("lsp_signature").on_attach {
  bind = true,
  hint_prefix = "WORKING",
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
}

vim.keymap.set({ 'n' }, '<Leader>kk', function()       require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
