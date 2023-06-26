local oil_status, oil = pcall(require, "oil")
if not oil_status then
  return
end

oil.setup({})
