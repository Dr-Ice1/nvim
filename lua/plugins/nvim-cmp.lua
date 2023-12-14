return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		vim.opt.completeopt = "menu,menuone,noselect"
    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
		cmp.setup({
      completion = {
        autocomplete = {
          cmp.TriggerEvent.TextChanged,
          cmp.TriggerEvent.InsertEnter,
        },
        completeopt = "menu,noselect",
        keyword_length = 1,
      },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
        require("luasnip.loaders.from_snipmate").load({ path = { "~/.config/nvim/snippets/" }}),
      },
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip"}, -- snippets
        { name = "omni" },
        { name = "buffer"},
				{ name = "path" }, -- file system paths
        { name = "latex_symbols",
            filetype = { "tex", "latex" },
            option = { cache = true }, -- avoids reloading each time
        },
			}),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        --omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        omni = "[VimTex]",
        buffer = "[Buffer]",
        spell = "[Spell]",
        latex_symbols = "[Symbols]",
        cmdline = "[CMD]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
      },
		})
	end,
	dependencies = {
		"onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
		},
    'saadparwaiz1/cmp_luasnip',
	},
}
