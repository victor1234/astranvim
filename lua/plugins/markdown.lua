-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE


---@type LazySpec
return {
  {
    "epwalsh/obsidian.nvim",
    opts = function(_, opts)
      opts.workspaces = {
        {
          name = "KnowledgeBase",
          path = "~/share/general/Obsidian/KnowledgeBase"
        },
      }
      opts.dir = nil
      opts.templates = nil
      return opts
    end,
  },
}
