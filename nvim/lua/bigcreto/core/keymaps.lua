vim.g.mapleader = ";"

local keymap = vim.keymap

-- Window keymaps.
keymap.set("n", "<leader>wc", "<c-w>c") -- Close active window.
keymap.set("n", "<leader>wo", "<c-w>o") -- Close all windows except active.
keymap.set("n", "<leader>wh", "<c-w>h") -- Move cursor to window left of current.
keymap.set("n", "<leader>wj", "<c-w>j") -- Move cursor to window below current.
keymap.set("n", "<leader>wk", "<c-w>k") -- Move cursor to window above current.
keymap.set("n", "<leader>wl", "<c-w>l") -- Move cursor to window right of current.
keymap.set("n", "<leader>wu", "<c-w>s") -- Split current window.
keymap.set("n", "<leader>wi", "<c-w>v") -- Vertically split current window.
keymap.set("n", "<leader>wr", "<c-w>r") -- Rotate windows downwards/rightwards.
keymap.set("n", "<leader>wR", "<c-w>R") -- Rotate windows upwards/leftwards.

-- Tab keymaps.
keymap.set("n", "<leader>tn", ":tabnew<CR>")      -- Start a new tab.
keymap.set("n", "<leader>tc", ":tabclose<CR>")    -- Close active tab.
keymap.set("n", "<leader>to", ":tabonly<CR>")     -- Close all tabs except active.
keymap.set("n", "<leader>tj", ":tabnext<CR>")     -- Go to next tab.
keymap.set("n", "<leader>tk", ":tabprevious<CR>") -- Go to previous tab.
keymap.set("n", "<leader>th", ":tabfirst<CR>")    -- Go to first tab.
keymap.set("n", "<leader>tl", ":tablast<CR>")     -- Go to last tab.

-- Nvim tree keymaps.
keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>") -- Toggle Nvim Tree.
keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>")  -- Move cursor to Nvim Tree if open.

-- Telescope keymaps.
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
