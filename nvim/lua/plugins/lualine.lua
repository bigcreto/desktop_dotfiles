local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  return
end

lualine.setup({
  options = {
    theme = "auto"
  },
  tabline = {
    lualine_a = { 'filename' },
    lualine_b = { 'windows' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' }

  },
  extensions = {
    "nvim-tree",
  }
})
