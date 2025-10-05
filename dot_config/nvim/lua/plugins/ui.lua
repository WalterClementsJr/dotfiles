return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-mini/mini.icons" } },
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Browse files from here" },
    },
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
    lazy = false,
    config = function(_, opts)
      require("oil").setup(opts)
    end,
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        cursorline = {
          bold = false,
          bold_number = false,
          theme = "light",
          blend = 0.8,
        },
	},
    config = function(_, opts)
      local nordic = require("nordic")
      nordic.setup(opts)
      nordic.load()
    end,
  },
}
