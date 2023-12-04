vim.g.vimtex_view_general_viewer = 'SumatraPDF'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_view_general_options = '-reuse-instance @pdf'


return {

  'lervag/vimtex',
  lazy = false,


}
