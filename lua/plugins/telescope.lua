return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    return vim.tbl_deep_extend("force", opts or {}, {
      pickers = {
        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true,
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer }, -- delete buffer
            n = { ["d"]     = actions.delete_buffer },
          },
        },
      },
    })
  end,
}

