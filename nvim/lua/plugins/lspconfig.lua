local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["bashls"].setup({
  capabilities = capabilities,
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
})

lspconfig["jdtls"].setup({
  capabilities = capabilities,
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

typescript.setup({
  server = {
    capabilities = capabilities
  }
})

lspconfig["vimls"].setup({
  capabilities = capabilities,
})

lspconfig["yamlls"].setup({
  capabilities = capabilities,
})

