local keymap = vim.keymap
local opts = { noremap = true, silent = true}


keymap.set('n', '<leader>tf',':NvimTreeFocus<CR>', opts)
keymap.set('n','<leader>tt',':NvimTreeToggle<CR>', opts)

keymap.set("v", "<", "<gv") -- Shift Indentation to Left
keymap.set("v", ">", ">gv") -- Shift Indentation to Right


--[[ Telescope keymaps ]]
vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>', opts)


