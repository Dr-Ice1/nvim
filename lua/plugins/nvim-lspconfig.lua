local on_attach        = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs
local cmp_nvim_lsp     = require("cmp_nvim_lsp")

local config = function()
  require("neoconf").setup({})

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- --- define configs (new API) ---
  vim.lsp.config["lua_ls"] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("config") .. "/lua",
        }},
      },
    },
  }

  vim.lsp.config["jsonls"] = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
  }

  vim.lsp.config["pyright"] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      pyright = { disableOrganizeImports = false },
      python = {  -- common pyright key
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/python")] = true,
            [vim.fn.stdpath("config") .. "/python"] = true,
          },
        },
      },
    },
  }

  vim.lsp.config["bashls"]     = { capabilities = capabilities, on_attach = on_attach, filetypes = { "sh", "aliasrc" } }
  vim.lsp.config["solidity"]   = { capabilities = capabilities, on_attach = on_attach, filetypes = { "solidity" } }
  vim.lsp.config["emmet_ls"]   = { capabilities = capabilities, on_attach = on_attach, filetypes = {
    "typescriptreact","javascriptreact","javascript","css","sass","scss","less","svelte","vue","html",
  }}
  vim.lsp.config["dockerls"]   = { capabilities = capabilities, on_attach = on_attach }
  vim.lsp.config["clangd"]     = { capabilities = capabilities, on_attach = on_attach, cmd = { "clangd","--offset-encoding=utf-16" } }
  vim.lsp.config["texlab"]     = { capabilities = capabilities, on_attach = on_attach, settings = {
    Latex = { workspace = { library = {
      [vim.fn.expand("$VIMRUNTIME/latex")] = true,
      [vim.fn.stdpath("config") .. "/latex"] = true,
    }}},
  }}

  -- EFM
  local luacheck     = require("efmls-configs.linters.luacheck")
  local stylua       = require("efmls-configs.formatters.stylua")
  local flake8       = require("efmls-configs.linters.flake8")
  local black        = require("efmls-configs.formatters.black")
  local eslint_d     = require("efmls-configs.linters.eslint_d")
  local prettier_d   = require("efmls-configs.formatters.prettier_d")
  local fixjson      = require("efmls-configs.formatters.fixjson")
  local shellcheck   = require("efmls-configs.linters.shellcheck")
  local shfmt        = require("efmls-configs.formatters.shfmt")
  local hadolint     = require("efmls-configs.linters.hadolint")
  local solhint      = require("efmls-configs.linters.solhint")
  local cpplint      = require("efmls-configs.linters.cpplint")
  local clangformat  = require("efmls-configs.formatters.clang_format")
  local vale         = require("efmls-configs.linters.vale")
  local latexindent  = require("efmls-configs.formatters.latexindent")

  vim.lsp.config["efm"] = {
    filetypes = {
      "lua","python","json","jsonc","sh","javascript","javascriptreact","typescript","typescriptreact",
      "svelte","vue","markdown","docker","solidity","html","css","c","cpp","latex",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = { luacheck, stylua },
        python = { flake8, black },
        typescript = { eslint_d, prettier_d },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        sh = { shellcheck, shfmt },
        javascript = { eslint_d, prettier_d },
        javascriptreact = { eslint_d, prettier_d },
        typescriptreact = { eslint_d, prettier_d },
        svelte = { eslint_d, prettier_d },
        vue = { eslint_d, prettier_d },
        markdown = { prettier_d },
        docker = { hadolint, prettier_d },
        solidity = { solhint },
        html = { prettier_d },
        css = { prettier_d },
        c = { clangformat, cpplint },
        cpp = { clangformat, cpplint },
        latex = { vale, latexindent },
      },
    },
  }

  -- --- enable the configs you defined (IMPORTANT) ---
  vim.lsp.enable({
    "lua_ls","jsonls","pyright","bashls","solidity","emmet_ls",
    "dockerls","clangd","texlab","efm",
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
