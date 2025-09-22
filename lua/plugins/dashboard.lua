return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    -- Detect which fzf command is available
    local file_action = (vim.fn.exists(':FzfLua') == 2 and 'FzfLua files')
      or (vim.fn.exists(':Files') == 2 and 'Files')
      or 'edit .'

    local grep_action = (vim.fn.exists(':FzfLua') == 2 and 'FzfLua live_grep')
      or (vim.fn.exists(':Rg') == 2 and 'Rg')
      or ''

    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = { enable = true },
        shortcut = {
          {
            desc = '󰒲 Lazy',
            group = '@property',
            action = 'Lazy',
            key = 'l',
          },
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = file_action,
            key = 'f',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Grep',
            group = 'Label',
            action = grep_action,
            key = 'g',
          },
          {
            desc = '󰩈 Quit',
            group = '@property',
            action = ':q',
            key = 'q',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}

