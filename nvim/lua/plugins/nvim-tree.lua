local tree_status, tree = pcall(require, "nvim-tree")
if not tree_status then
  return
end

tree.setup()
