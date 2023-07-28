return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint_status, lint = pcall(require, "lint")
      if not lint_status then
        return
      end

      lint.linters_by_ft = {
        go = { 'golangci-lint' },
      }

    end,
  },
}
