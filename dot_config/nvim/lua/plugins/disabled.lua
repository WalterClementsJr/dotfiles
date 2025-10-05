return {
  {
    "saghen/blink.cmp",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    -- disable the clock https://www.lazyvim.org/plugins/ui#lualinenvim
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
