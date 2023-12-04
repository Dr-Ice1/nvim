local M = {} 

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }


  vim.keymap.set("n","lf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- go to definition
  vim.keymap.set("n","pd", "<cmd>Lspsaga peek_definition<CR>",  opts) -- peak definition
  vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>",  opts) -- go to definition
  vim.keymap.set("n","aa", "<cmd>Lspsaga code_action<CR>",  opts) -- see available code actions
  vim.keymap.set("n","<leader>rn", "<cmd>Lspsaga rename<CR>",  opts) -- smart rename
  vim.keymap.set("n","ld", "<cmd>Lspsaga show_line_diagnostics<CR>",  opts) -- show  diagnostics for line
  vim.keymap.set("n","cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>",  opts) -- show diagnostics for cursor
  vim.keymap.set("n","vc", "<cmd>Lspsaga diagnostic_jump_prev<CR>",  opts) -- jump to prev diagnostic in buffer
  vim.keymap.set("n","tc", "<cmd>Lspsaga diagnostic_jump_next<CR>",  opts) -- jump to next diagnostic in buffer
  vim.keymap.set("n","K", "<cmd>Lspsaga hover_doc<CR>",  opts) -- show documentation for what is under cursor
  end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰠠", Info = "" }

return M
