require("config.lazy")
require("core.keymaps")
require("core.colorscheme")
require("core.options")
require('lualine').setup {options = { theme = 'solarized_dark' }}
pcall(require, "config.lsp")

