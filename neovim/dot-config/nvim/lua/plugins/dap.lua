return {
  'mfussenegger/nvim-dap',
  init = function()
    -- vim.api.nvim_set_hl(0, 'debug', {
    --   bg = '#FFFFFF',
    --   fg = '#000000'
    -- })

    -- vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    -- vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
    -- vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
    -- vim.fn.sign_define('DapStopped', { text = '→', texthl = '', linehl = '', numhl = '' })
    -- vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = '', linehl = '', numhl = '' })

    vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = 'C', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = '', linehl = '', numhl = '' })
  end,
  keys = {
    { '<leader>rc', function() require("dap").continue() end,  desc = '[C]ontinue' },
    {
      '<leader>rC',
      function()
        require("dap").continue({
          before = function(config)
            local args_string = vim.fn.input('Arguments: ')
            config.args = vim.split(args_string, " +")
          end
        })
      end
    },
    { '<leader>ri', function() require("dap").step_into() end, desc = 'Step [O]ver' },
    { '<leader>ro', function() require("dap").step_over() end, desc = 'Step [O]ver' },
    { '<leader>rO', function() require("dap").step_out() end,  desc = 'Step [O]ver' },
    { '<leader>rT', function() require("dap").terminate() end, desc = 'Step [O]ver' },
    {
      '<leader>rb',
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = 'Toggle [B]reakpoint'
    },
    {
      '<leader>rB',
      function()
        local condition = vim.fn.input("Condition: ")
        local hit_count = vim.fn.input("Hit count: ")
        local log_message = vim.fn.input("Log message: ")
        condition = condition ~= "" and condition or nil
        hit_count = hit_count ~= "" and hit_count or nil
        log_message = log_message ~= "" and log_message or nil
        require("dap").set_breakpoint(condition, hit_count, log_message)
      end,
      desc = "Conditional [B]reakpoint"
    }
  },
}
