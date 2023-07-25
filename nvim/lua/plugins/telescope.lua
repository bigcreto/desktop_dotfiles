return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope_status, telescope = pcall(require, "telescope")
      if not telescope_status then
        return
      end

      local actions_status, actions = pcall(require, "telescope.actions")
      if not actions_status then
        return
      end

      local builtin_status, builtin = pcall(require, "telescope.builtin")
      if not builtin_status then
        return
      end

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      -- Telescope File Pickers.
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})

      -- Telescope Vim Pickers.
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fc", builtin.commands, {})
      vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
      vim.keymap.set("n", "<leader>fr", builtin.registers, {})
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
      vim.keymap.set("n", "<leader>fB", builtin.current_buffer_fuzzy_find, {})

      -- Telescope Neovim LSP Pickers.
      vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
      vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, {})
      vim.keymap.set("n", "<leader>lk", builtin.lsp_definitions, {})
      vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, {})

      -- Telescope Git Pickers.
      -- Telescope Treesitter Picker.
      vim.keymap.set("n", "<leader>fu", builtin.treesitter, {})


    end,
  },
}
