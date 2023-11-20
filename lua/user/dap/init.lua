local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.set_log_level("TRACE")
local lldb = require("user.dap.lldb")
local dapui = require("dapui")

-- TODO: move to separate file
dapui.setup()

dap.adapters.lldb = {
  type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
  args = {}
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = "codelldb", -- Installed with :MasonInstall
      args = {"--port", "${port}"},
    }
  }

dap.configurations.cpp = lldb
dap.configurations.c = dap.configurations.cpp

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
