return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  event = "BufRead *.py",
  keys = {
    { '<leader>rv', function() require("dap-python").debug_selection() end, desc = 'Debug selection', ft = "python", mode = "v" },
    { '<leader>tm', function() require("dap-python").test_method() end,     desc = 'Test method',     ft = "python" },
    { '<leader>tc', function() require("dap-python").test_class() end,      desc = 'Test class',      ft = "python" },
  },
  config = function()
    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path == nil then
      print("no active virtual environment - unable to activate python dap")
      return
    end

    local python_path = venv_path .. '/bin/python'

    require("dap-python").setup(python_path, { include_configs = false })
  end
}
