return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  main = 'ibl',
  opts = {
    exclude = {
    filetypes = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'man',
        'dashboard',
        '',
      },
    }
  },

}
