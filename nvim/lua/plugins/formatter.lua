return {
  {
    "mhartington/formatter.nvim",
    config = function()
      local formatter_status, formatter = pcall(require, "formatter")
      if not formatter_status then
        return
      end

      formatter.setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          }
        },
      })

      vim.api.nvim_create_autocmd( "FileType", {
        pattern = { "c", "cpp", "rust" },
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "<leader>lf", vim.cmd.Format, opts)
        end,
      })
    end,
  }
}
