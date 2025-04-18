return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {},
        },
      })
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>uu", "<cmd>Telescope file history<cr>")
    end,
  },
}
