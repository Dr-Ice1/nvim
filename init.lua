require('config')
require('plugins')
vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.nodejs_host_prog = '/usr/bin/nodejs'

require('lspconfig').pyright.setup({})
require('lspconfig').texlab.setup({})

require('plugins.nvim-cmp')
require('lualine').setup()
