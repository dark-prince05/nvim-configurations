vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

--window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save the changes" })

-- Yank without copying to the clipboard
keymap.set("n", "y", '"*y', { desc = "Yank without clipboard" })
keymap.set("v", "y", '"*y', { desc = "Yank without clipboard" })

-- Copy to clipboard
keymap.set("n", "<C-y>", '"+y', { desc = "Yank to clipboard" })
keymap.set("v", "<C-y>", '"+y', { desc = "Yank to clipboard" })

-- Paste from clipboard
keymap.set("n", "<C-p>", '"+p', { desc = "Paste from clipboard" })
keymap.set("v", "<C-p>", '"+p', { desc = "Paste from clipboard" })

-- -- Paste without using clipboard
-- keymap.set("n", "p", '"*p', { desc = "Paste without clipboard" })
-- keymap.set("v", "p", '"*p', { desc = "Paste without clipboard" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete without yanking" })

-- Move line up
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Move line down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- Open terminal in a horizontal split and enter insert mode automatically
keymap.set("n", "<C-t>", "<cmd>split | terminal<CR>", { desc = "Open terminal in horizontal split and enter insert mode" })

-- Map Ctrl+k in terminal mode to switch back to the previous window
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>p", { desc = "Switch back to previous window from terminal" })

-- Automatically enter insert mode when opening terminal or switching to terminal
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.cmd('startinsert')
  end
})

-- Ensure the terminal always starts in insert mode when opened
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  command = "startinsert"
})
