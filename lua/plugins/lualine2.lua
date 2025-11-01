return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local prose = require 'nvim-prose'
    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
      },
      sections = {
          lualine_x = {
              'encoding', 'fileformat', 'filetype',
              { prose.word_count,   cond = prose.is_available },
              { prose.reading_time, cond = prose.is_available },
          },
        -- lualine_y normally shows fileformat (with penguin)
        -- Replace it with a simple Apple icon component
        lualine_y = {
          {
            function()
              return "hoi"  -- optional label (or "" for just the icon)
            end,
            icon = { "", color = { fg = "#000000" } }, -- Apple icon
          },
        },
      },
    })
  end,
}

