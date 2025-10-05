return {
  { "nvim-mini/mini.nvim", version = false },
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
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      local keys = {
        {
          "<leader>H",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon Add File",
        },
        {
          "<leader>h",
          function()
            local harpoon = harpoon
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            harpoon:list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  },
}
