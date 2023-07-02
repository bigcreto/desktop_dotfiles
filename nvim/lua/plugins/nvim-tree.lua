local tree_status, tree = pcall(require, "nvim-tree")
if not tree_status then
  return
end

local keymap = vim.keymap
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function tree_on_attach(bufnr)
  local tree_api_status, tree_api = pcall(require, "nvim-tree.api")
  if not tree_api_status then
    return
  end

  tree_api.config.mappings.default_on_attach(bufnr)

  keymap.set("n", "<C-Enter>", tree_api.tree.change_root_to_node)
end



tree.setup({
  on_attach = tree_on_attach

})
