return {
  'mfussenegger/nvim-dap-python',
  config = function()
    local status, dap = pcall(require, 'dap')
    if not status then
      return
    end
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file (justMyCode = false)',
        program = '${file}',
        justMyCode = false,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file with arguments (justMyCode = false)',
        program = '${file}',
        justMyCode = false,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, ' +')
        end,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file (console = integratedTerminal, justMyCode = false)',
        program = '${file}',
        console = 'integratedTerminal',
        justMyCode = false,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file with arguments (console = integratedTerminal, justMyCode = false)',
        program = '${file}',
        console = 'integratedTerminal',
        justMyCode = false,
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, ' +')
        end,
      },
    }
    local dap_python = require("dap-python")
    dap_python.setup("python3", {
      include_configs = true,
      console = 'integratedTerminal',
      pythonPath = nil,
    })
  end
}
