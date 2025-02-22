return {
  {
    "saghen/blink.cmp",
    enabled = false,
  },
  {
    -- disable the clock https://www.lazyvim.org/plugins/ui#lualinenvim
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
}
