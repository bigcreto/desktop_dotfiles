return {
  {
    -- Neovim Fidget LSP Progressbar
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach", -- On LSP attach show fidget
    opts = {
      text = {
        spinner = "pipe"
      },
      -- align = {},
      -- timer = {},
      window = {
        border = "rounded",
      },
      -- fmt = {},
      -- sources = {},
      -- debug = {},
    }
  },
}
