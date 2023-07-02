-- Nvim keymap configuration.

  vim.g.mapleader = ";"

  local keymap = vim.keymap


-- Window keybinds.
  keymap.set("n", "<leader>wq", "<c-w>q") -- Close active window.
  keymap.set("n", "<leader>wo", "<c-w>o") -- Close all windows except active.

  keymap.set("n", "<leader>wu", "<c-w>s") -- Split active window.
  keymap.set("n", "<leader>wi", "<c-w>v") -- Vertically split active window.

  keymap.set("n", "<leader>wh", "<c-w>h") -- Move cursor to window left of current.
  keymap.set("n", "<leader>wj", "<c-w>j") -- Move cursor to window below current.
  keymap.set("n", "<leader>wk", "<c-w>k") -- Move cursor to window above current.
  keymap.set("n", "<leader>wl", "<c-w>l") -- Move cursor to window right of current.

  keymap.set("n", "<leader>wH", "<c-w>H") -- Move the current window to be at the far left, using the full height of the screen.  
  keymap.set("n", "<leader>wJ", "<c-w>J") -- Move the current window to be at the very bottom, using the full width of the screen. 
  keymap.set("n", "<leader>wK", "<c-w>K") -- Move the current window to be at the very top, using the full width of the screen.  
  keymap.set("n", "<leader>wL", "<c-w>L") -- Move the current window to be at the far right, using the full height of the screen. 

  keymap.set("n", "<leader>wr", "<c-w>r") -- Rotate windows downwards/rightwards.
  keymap.set("n", "<leader>wR", "<c-w>R") -- Rotate windows upwards/leftwards.

  keymap.set("n", "<leader>wf", "<c-w>f") -- Open file under cursor in new window.

-- Tab keybinds.
  keymap.set("n", "<leader>tq", vim.cmd.tabclose)    -- Close active tab.
  keymap.set("n", "<leader>tn", vim.cmd.tabnew)      -- Create a new tab.
  keymap.set("n", "<leader>th", vim.cmd.tabfirst)    -- Go to the first tab.
  keymap.set("n", "<leader>tj", vim.cmd.tabnext)     -- Go to the next tab.
  keymap.set("n", "<leader>tk", vim.cmd.tabprevious) -- Go to the previous tab.
  keymap.set("n", "<leader>tl", vim.cmd.tablast)     -- Go to the last tab.


-- Buffer keybinds.

-- NvimTree keybinds.
  keymap.set("n", "<leader>ft", vim.cmd.NvimTreeToggle)
  keymap.set("n", "<leader>fr", vim.cmd.NvimTreeFocus)

-- Telescope keybinds.

  local telescope_builtin_status, telescope_builtin = pcall(require, "telescope.builtin")
  if not telescope_builtin_status then
    return
  end

  keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
  keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
  keymap.set("n", "<leader>fm", telescope_builtin.man_pages, {})
  keymap.set("n", "<leader>fk", telescope_builtin.keymaps, {})
  keymap.set("n", "<leader>fo", telescope_builtin.oldfiles, {})

