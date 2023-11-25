local M = {}

M.dap = {
  n = {
    ['<leader>rqx'] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ['<leader>rax'] = {
      function()
        local widgets = require('dap.ui.widgets')
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>rxx"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over"
    },
    ["<leader>rzx"] = {
      "<cmd> RustDebuggables <CR>",
      "Open debuggables"
    }
  }
}

M.crates = {
  n = {
    ['<leader>rcu'] = {
      function()
        require('crates').upgrade_all_crates()
      end,
      "Upgrade crates"
    }
  }
}

return M
