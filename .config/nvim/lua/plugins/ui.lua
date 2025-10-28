return {
  {
    "nanozuki/tabby.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "16color",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
    },
    config = function(_, options)
      require("lualine").setup(options)
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "raphamorim/lucario",
    lazy = false,
    priority = 1000,
  },
  {
    "challenger-deep-theme/vim",
    lazy = false,
    priority = 1000,
  },
}
