return {
  {
    -- Neovim Formatter.
    "mhartington/formatter.nvim",
    config = function()
      -- Protected call Neovim Formatter.
      local formatter_status, formatter = pcall(require, "formatter")
      if not formatter_status then
        return
      end

      -- Formatter configuration.
      formatter.setup({
        logging = true,
        log_level = vim.log.levels.WARN,

        -- Formatter filetype configuration.
        filetype = {
          -- For C files use Clang-Format.
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          -- For C++ files use Clang-Format.
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          -- For Rust files use Rustfmt.
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          }
        },
      })

      -- On filetype add format keymap.
      vim.api.nvim_create_autocmd( "FileType", {
        pattern = { "c", "cpp", "rust" },
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "<leader>lf", vim.cmd.Format, opts)
        end,
      })
    end,
  }
}
