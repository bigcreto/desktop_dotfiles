return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          local dap_status, dap = pcall(require, "dap")
          if not dap_status then
            return
          end

          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = "/home/jack/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
              args = { "--port", "${port}" },
            }
          }

          dap.configurations.rust = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }
        end,
      },
    },
    config = function()
      local dapui_status, dapui = pcall(require, "dapui")
      if not dapui_status then
        return
      end

      dapui.setup({})
    end,
  }
}
