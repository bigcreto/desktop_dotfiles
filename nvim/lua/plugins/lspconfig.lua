return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", opts = {} },
      {
        "folke/neodev.nvim",
        opts = {
          library = {
            plugins = {
              "nvim-dap-ui"
            },
            types = true,
          },
        },
      },
      { "simrat39/rust-tools.nvim" },
    },
    config = function()
      local lspconfig_status, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status then
        return
      end

      local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if not cmp_lsp_status then
        return
      end

      local rust_tools_status, rust_tools = pcall(require, "rust-tools")
      if not rust_tools_status then
        return
      end

      local rust_tools_dap_status, rust_tools_dap = pcall(require,"rust-tools.dap")
      if not rust_tools_dap_status then
        return
      end

      local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/extension/adapter/codelldb"
      local liblldb_path = vim.fn.stdpath("data") .. "/mason/packages/extension/lldb/lib/liblldb.so"

      local capabilities = cmp_lsp.default_capabilities()

      lspconfig["clangd"].setup({
        capabilities = capabilities,
      })

      lspconfig["gopls"].setup({
        capabilities = capabilities,
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
      })

      lspconfig["ocamllsp"].setup({
        capabilities = capabilities,
      })

      rust_tools.setup({
        tools = {
          executor = require("rust-tools.executors").toggleterm,
          inlay_hints = {
            other_hints_prefix = "-> ",
          },
        },
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>rh", rust_tools.hover_actions.hover_actions, { buffer = bufnr } )
            vim.keymap.set("n", "<leader>ra", rust_tools.code_action_group.code_action_group, { buffer = bufnr } )

          end,
          capabilities = capabilities,
          standalone = true,
        },
         dap = {
            adapter = rust_tools_dap.get_codelldb_adapter(codelldb_path, liblldb_path)
         },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          -- vim.keymap.set("n", "<space>f", function()
          --   vim.lsp.buf.format { async = true }
          -- end, opts)
        end,
      })
    end,
  },
}
