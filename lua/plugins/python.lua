return {
  -- Treesitter: python, toml
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },

  --  Install basedpyright, ruff
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "basedpyright", "ruff" })
    end,
  },

  -- AstroLSP: basedpyright, ruff configurations
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        -- basedpyright
        basedpyright = {
          before_init = function(_, c)
            c.settings = c.settings or {}
            c.settings.python = c.settings.python or {}
            c.settings.python.pythonPath = vim.fn.exepath "python"
          end,
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedFunction = "information",
                  reportUnusedVariable = "information",
                  reportGeneralTypeIssues = "none",
                  reportOptionalMemberAccess = "none",
                  reportOptionalSubscript = "none",
                  reportPrivateImportUsage = "none",
                },
              },
            },
          },
        },

        -- ruff
        ruff = {
          on_attach = function(client)
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.python = { "ruff_organize_imports", "ruff_format" }

      return opts
    end,
  },

  -- NeoTest
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "nvim-neotest/neotest-python" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      local np_opts = require("astrocore").plugin_opts "neotest-python" or {}
      table.insert(opts.adapters, require "neotest-python"(np_opts))
    end,
  },
}
