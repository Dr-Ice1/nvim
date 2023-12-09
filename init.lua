require('config')
vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.nodejs_host_prog = '/usr/bin/nodejs'

require('plugins.nvim-lspconfig')
require('lspconfig').pyright.setup({})
require('plugins.texlab')
require('lspconfig').texlab.setup({})
require('plugins.vimtex')
require('plugins.bufferline')
require('lualine').setup()


