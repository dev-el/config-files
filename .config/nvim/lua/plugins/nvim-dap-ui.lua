return {
  'rcarriga/nvim-dap-ui',
  tag = "v3.7.2",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  opts = {
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.50 },
          { id = "breakpoints", size = 0.20 },
          { id = "stacks", size = 0.15 },
          { id = "watches", size = 0.15 },
        },
        relative = "win",
        position = "left",
        size = 20,
      },
      {
        elements = {
          { id = "console", size = 0.5 },
          { id = "repl", size = 0.5 },
        },
        relative = "win",
        position = "bottom",
        size = 5,
      },
    },
    mappings = {
      edit = "c",
      expand = { "<CR>", "<2-LeftMouse>", "e" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
  },
  config = function(_, opts)
    local dapui = require('dapui')
    dapui.setup(opts)
    local dap = require("dap")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
