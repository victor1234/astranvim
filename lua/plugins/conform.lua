return {
  "AstroNvim/astrolsp",
  dependencies = { "stevearc/conform.nvim" },
  opts = function(_, opts)
    local function format()
      require("conform").format {
        lsp_fallback = true,
        async = true,
      }
    end

    -- override default AstroLSP mapping
    opts.mappings.n["<leader>lf"] = { format, desc = "Format (Conform → LSP)" }
    opts.mappings.v["<leader>lf"] = { format, desc = "Format selection (Conform → LSP)" }

    return opts
  end,
}
