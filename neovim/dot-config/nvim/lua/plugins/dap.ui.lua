return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  opts = {},
  keys = {
    { '<leader>ow', function() require("dapui").toggle() end, desc = 'DAP UI' }
  },
  init = function()
    local dap = require('dap')
    dap.listeners.before.attach.dapui_config = function()
      require("dapui").open({})
    end
    dap.listeners.before.launch.dapui_config = function()
      require("dapui").open({})
    end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   require("dapui").close()
    -- end
  end
}