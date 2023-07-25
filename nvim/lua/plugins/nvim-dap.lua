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
            type = 'server',
            port = "${port}",
            executable = "/home/jack/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
            args = {"--port", "${port}"},
          }

        end,
      },
    },
    config = function()
      local dapui_status, dapui = pcall(require, "dapui")
      if not dapui_status then
        return
      end

      dapui.setup()

      local keymap = vim.keymap

      keymap.set("n", "<leader>dt", dapui.toggle, {})
    end,
  },
}
