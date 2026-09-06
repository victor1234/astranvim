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
