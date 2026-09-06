return {
  -- Treesitter: python, toml
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.markdown = { "mdformat" }

      return opts
    end,
  },

  -- Render Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    ft = { "markdown" },
    keys = {
      {
        "<leader>M",
        function() require("render-markdown").buf_toggle() end,
        desc = "Toggle Markdown rendering",
      },
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = { anti_conceal = { enabled = false } },
  },
}
