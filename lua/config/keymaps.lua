local keymap = vim.keymap

local opts = { noremap = true, silent = true}

keymap.set('n', '<leader>tf',':NvimTreeFocus<CR>', opts)
keymap.set('n','<leader>tt',':NvimTreeToggle<CR>', opts)



keymap.set('n', "<c-h>", "<C-w>h", opts) -- Navigate Left
keymap.set('n', "<c-j>", "<C-w>j", opts) -- Navigate Down
keymap.set('n', "<c-k>", "<C-w>k", opts) -- Navigate Up
keymap.set('n', "<c-l>", "<C-w>l", opts) -- Navigate Right

keymap.set('n', "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set('n', "<leader>sh", ":split<CR>", opts) -- Split Horizontally

--[[ Telescope keymaps ]]
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>', opts)


keymap.set("v", "<", "<gv") -- Shift Indentation to Left
keymap.set("v", ">", ">gv") -- Shift Indentation to Right

vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })





