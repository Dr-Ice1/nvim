-- SYSTEM
vim.g.mapleader = " "

vim.keymap.set("n", "j", function() return vim.v.count == 0 and "gj" or "j" end, {expr=true, silent=true})
vim.keymap.set("n", "k", function() return vim.v.count == 0 and "gk" or "k" end, {expr=true, silent=true})

vim.keymap.set('n', '<leader>cl', 'gcc', { remap = true, silent = true })

-- put this in your init.lua or a Lua config file
vim.keymap.set("n", "<leader>rw", function()
  local word = vim.fn.input("Word to search: ")
  if word == "" then return end
  local replacement = vim.fn.input("Replace with: ")
  -- do the substitution in the whole file, 'g' for all occurrences, 'c' to confirm
  vim.cmd(string.format("%%s/%s/%s/gc", word, replacement))
end, { desc = "Search and replace word" })


-- PLUGINS
--
--


-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Dashboard
vim.keymap.set("n", "<leader>db", "<CMD>Dashboard<CR>")
vim.keymap.set("n", "<leader>da", "<C-^>")

-- Markdown
vim.keymap.set("n", "<leader>md", "<CMD>MarkdownPreview<CR>")

-- Bufferline
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true })
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true })
vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { silent = true })
vim.keymap.set('n', '<leader>cb', '<CMD>bdelete<CR>', { silent = true })

-- Telescope
-- -- <leader>bl → floating buffer list
vim.keymap.set("n", "<leader>bl", function()
  require("telescope.builtin").buffers(require("telescope.themes").get_dropdown{
    previewer = false,
    winblend = 8,
  })
end, { desc = "Buffer list (Telescope)" })

-- Live Preview

vim.keymap.set('n', '<leader>lp', '<CMD>LivePreview start<CR>', { silent = true })
