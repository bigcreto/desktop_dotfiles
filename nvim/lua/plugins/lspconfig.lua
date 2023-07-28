return {
  {
    -- Neovim LSP Boilerplate.
    "neovim/nvim-lspconfig",

    -- Dependencies 
    dependencies = {
      { "folke/neoconf.nvim", opts = {} },
      {
        "folke/neodev.nvim",
        opts = {
          library = { plugins = { "nvim-dap-ui" }, types = true },
        },
      },
      { "simrat39/rust-tools.nvim" },
      { "b0o/schemastore.nvim"     },
    },
    config = function()
      -- Protected call Neovim Builtin LSP Boilerplate Configuration
      local lspconfig_status, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status then
        return
      end

      -- Protected call Nvim CMP LSP Source
      local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if not cmp_lsp_status then
        return
      end

      -- Protected call Rust Tools
      local rust_tools_status, rust_tools = pcall(require, "rust-tools")
      if not rust_tools_status then
        return
      end

      -- local codelldb_path = "/home/jack/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
      -- local liblldb_path = "/home/jack/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so"

      -- Define CMP LSP Source Capabilities
      local capabilities = cmp_lsp.default_capabilities()

      lspconfig["clangd"].setup({
        capabilities = capabilities,
      })

      lspconfig["gopls"].setup({
        capabilities = capabilities,
      })

      lspconfig["hls"].setup({
        capabilities = capabilities,
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
      })

      lspconfig["pyright"].setup({
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
          standalone = false,
        },
        -- dap = {
        --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
        -- }
      })

      lspconfig["yamlls"].setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas{
              select = {
                "Mason Registry",
              }
            },
            validate = { enable = true },
          }
        }
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local opts = { buffer = args.buf }

          if client.server_capabilities.hoverProvider then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          end

          if client.server_capabilities.declarationProvider then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          end

          if client.server_capabilities.definitionProvider then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          end

          if client.server_capabilities.implementationProvider then
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          end

          vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

        end,
      })
    end,
  },
}
