local function program()
  return vim.fn.input({
    prompt = 'Path to executable: ',
    default = vim.fn.getcwd() .. '/',
    completion = 'file'
  })
end

return {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = program,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
    runInTerminal = true,
    logging = {
      moduleLoad = false,
      engineLogging = true,
      trace = true,
      traceResponse = true
    },
  },
  {
    name = "codelldb: Launch",
    type = "codelldb",
    request = "launch",
    program = program,
    cwd = '${workspaceFolder}',
    args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
  },
  {
    name = "codelldb: Launch external",
    type = "codelldb",
    request = "launch",
    program = program,
    cwd = '${workspaceFolder}',
    args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
    terminal = 'external',
  },
  {
    name = "codelldb: Attach (input pid)",
    type = 'codelldb',
    request = 'attach',
    pid = function()
      return tonumber(vim.fn. input({ prompt = 'pid: '}))
    end,
    args = {},
    stopOnEntry = false,
    runInTerminal = false
  },
}
