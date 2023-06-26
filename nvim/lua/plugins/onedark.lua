local onedark_status, onedark = pcall(require, "onedark")
if not onedark_status then
  print("Colorscheme not found!")
  return
end

onedark.setup({
  style = "warmer"
})

onedark.load()


