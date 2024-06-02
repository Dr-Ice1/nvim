return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.4',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
    local trouble = require("trouble.sources.telescope")
    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open },
          n = { ["<c-t>"] = trouble.open },
        },
      },
    }
  end
    }
