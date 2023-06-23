local telescopeSetup, telescope = pcall(require, "telescope")
if not telescopSetup then
  return
end

local actionsSetup, actions = pcall(require, "telescope.actions")
if not actionsSetup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<leader>fk"] = actions.move_selection_previous,
        ["<leader>fj"] = actions.move_selection_next,
        ["<leader>fq"] = actions.send_selected_to_qflist + actions.open_qflist,


      }
    }
  }
})

telescope.load_extension("fzf")
