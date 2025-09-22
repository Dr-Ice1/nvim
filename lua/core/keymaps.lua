-- SYSTEM
vim.g.mapleader = " "

-- PLUGINS

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

