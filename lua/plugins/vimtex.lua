-- vim.g.vimtex_view_general_viewer = 'SumatraPDF'
-- vim.g.vimtex_compiler_method = 'latexmk'
-- vim.g.vimtex_view_general_options = '-reuse-instance @pdf'


return { "lervag/vimtex",
  lazy = false,
  tag = "v2.15",
  ft = {"tex", "markdown", "bib"},
  config = function()
       vim.g.vimtex_syntax_enabled = 1
       vim.g.vimtex_view_general_viewer = "SumatraPDF"
       vim.g.vimtex_quickfix_open_on_warning = 0
       vim.g.vimtex_view_enabled = 1
       vim.g.vimtex_compiler_method = 'latexmk'
  end,
}





