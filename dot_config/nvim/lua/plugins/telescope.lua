return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, opts)
      -- TODO: snacks vs telescope
      local telescope = require('telescope.builtin')
      keymap('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
      keymap('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
      keymap('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
      keymap('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      {
        "<leader>uu",
        "<cmd>Telescope undo<cr>",
        desc = "Telescope undo",
      },
    },
    opts = {
      extensions = {
        undo = {
          saved_only = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
}
