return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    servers = { "mise" },
    config = {
      mise = {
        cmd = { "mise", "lsp" },
        filetypes = { "toml" },
        root_markers = { "mise.toml", ".mise.toml" },
      },
    },
  },
}
