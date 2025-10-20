return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
    config = function()
      local dap = require("dap")
      local dui = require("dapui")
      dui.setup()

      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })

      vim.keymap.set("n", "<leader>da", function() dap.continue({ before = get_args }) end, { desc = "Run with Args" })
      vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })
      vim.keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Down" })
      vim.keymap.set("n", "<leader>dk", function() dap.up() end, { desc = "Up" })

      vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>d1", function() dap.continue() end, { desc = "Run/Continue" })
      vim.keymap.set("n", "<leader>d2", function() dap.step_over() end, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>d3", function() dap.step_into() end, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>d4", function() dap.step_out() end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dP", function() dap.pause() end, { desc = "Pause" })
      vim.keymap.set("n", "<leader>de", function() dui.eval(nil, { enter = true }) end, { desc = "Pause" })
      vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL evaluate" })

      vim.keymap.set("n", "<leader>ds", function() dap.session() end, { desc = "Session" })
      vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
      vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

      dap.listeners.before.attach.dapui_config = function() dui.open() end
      dap.listeners.before.launch.dapui_config = function() dui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dui.close() end

      -- setup dap config by VsCode launch.json file
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
    end,
  },
}
