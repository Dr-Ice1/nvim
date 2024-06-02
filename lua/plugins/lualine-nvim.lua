return {
	"nvim-lualine/lualine.nvim",
	event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  options = { theme = 'solarized dark'},
  config = function ()
    require('lualine').setup()
  end
  }
