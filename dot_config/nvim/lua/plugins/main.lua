return {
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  },
}
