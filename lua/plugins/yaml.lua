return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yaml" })
      end
    end,
  },

  -- Install yamlfmt
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "yamlfmt" })
    end,
  },

  -- Use schemastore in yamlls
  {
    "b0o/schemastore.nvim",
    dependencies = {
      {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          config = {
            yamlls = {
              settings = {
                yaml = {
                  schemaStore = { enable = false, url = "" },
                },
              },
              on_new_config = function(config)
                config.settings = config.settings or {}
                config.settings.yaml = config.settings.yaml or {}
                config.settings.yaml.schemas = config.settings.yaml.schemas or {}

                config.settings.yaml.schemas =
                  vim.tbl_deep_extend("force", config.settings.yaml.schemas, require("schemastore").yaml.schemas())
              end,
            },
          },
        },
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.yaml = { "yamlfmt" }
      return opts
    end,
  },
}
