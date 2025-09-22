-- lua/config/lsp.lua
vim.o.completeopt = "menu,menuone,noselect"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" }, -- Mason installs the server
})

-- capabilities (nvim-cmp if present)
local capabilities = (function()
  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  return ok and cmp_lsp.default_capabilities()
      or vim.lsp.protocol.make_client_capabilities()
end)()

-- NEW API: declare the config
vim.lsp.config("pyright", {
  capabilities = capabilities,
  -- on_attach = function(client, bufnr) ... end, -- if you have one
  -- settings = { python = { analysis = { ... } } }, -- optional
})

-- Start/attach the server(s) you configured
vim.lsp.enable({ "pyright" })
