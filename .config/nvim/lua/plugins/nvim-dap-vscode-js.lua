return {
  'mxsdev/nvim-dap-vscode-js',
  config = function()
    local status, dap = pcall(require, 'dap')
    if not status then
      return
    end
    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Run " .. language .. " file in Deno",
          runtimeExecutable = "deno",
          runtimeArgs = {
            "run",
            "--inspect-wait",
            "--allow-all"
          },
          program = "${file}",
          cwd = "${workspaceFolder}",
          attachSimplePort = 9229,
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Run " .. language .. " file in Node",
          runtimeExecutable = "node",
          program = "${file}",
          cwd = "${workspaceFolder}",
        }
      }
      local dap_vscode_js = require("dap-vscode-js")
      dap_vscode_js.setup(
      {
        node_path = "node",
        debugger_path = "/usr/bin/dapDebugServer.js",
        debugger_cmd = { "/usr/bin/dapDebugServer.js" },
        adapters = {
          'pwa-node',
        },
        log_file_path = vim.env.HOME .. "/Documents/nvim-dap-vscode-js/log/dap_vscode_js.log",
        log_file_level = 0,
        log_console_level = vim.log.levels.ERROR
      }

    )
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      name = 'dn_node',
      executable = {
        command = 'node',
        args = { "/usr/bin/dapDebugServer.js", "${port}" }
      }
    }
    end
  end
}
