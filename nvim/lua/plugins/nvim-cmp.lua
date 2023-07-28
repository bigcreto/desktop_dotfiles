return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        {
          "L3MON4D3/LuaSnip",
          run = "make install_jsregexp",
          dependencies = {
            {
              "rafamadriz/friendly-snippets",
              config = function()
                require("luasnip/loaders/from_vscode").lazy_load()
              end,
            },
          },
        },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "onsails/lspkind.nvim" },
      },
    },
    config = function()
      local cmp_status, cmp = pcall(require, "cmp")
      if not cmp_status then
        return
      end

      local luasnip_status, luasnip = pcall(require, "luasnip")
      if not luasnip_status then
        return
      end

      local lspkind_status, lspkind = pcall(require, "lspkind")
      if not lspkind_status then
        return
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = ({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline " },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[BUF]",
              luasnip = "[SNIP]",
              nvim_lsp = "[LSP]",
              path = "[PATH]",
            }),
          }),
        },
      })
    end,
  },
}
