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
  { "nvim-mini/mini.nvim", version = false },
  {
    "nvim-mini/mini.files",
    version = "*",
    config = function()
      require("mini.files").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local nordic = require("nordic")
      nordic.setup({
        cursorline = {
          bold = false,
          bold_number = false,
          theme = "light",
          blend = 0.8,
        },
      })
      nordic.load({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "yaml",
      },
    },
  },
  {
    "nanozuki/tabby.nvim",
    config = function()
      vim.o.showtabline = 2
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
