local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "java",
    "javascript",
    "lua",
    "typescript",
    "vim",
    "vimdoc",
    "query",
    "yaml"
  },
  auto_install = true
})
