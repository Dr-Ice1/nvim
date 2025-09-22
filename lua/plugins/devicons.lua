
-- lua/plugins/icons.lua
return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,                 -- load immediately so all UIs can use it
  config = function()
    require("nvim-web-devicons").setup({})
  end,
}
