local keymap = vim.keymap.set
local opts = { silent = true }

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

keymap("", "<leader>q", ":q<cr>")                       -- Quit vim
keymap("", "<leader>d", ":bd<cr>")                      -- Delete buffer

-- window nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split windows
keymap("n", "<leader>v", ":vsplit<cr>", opts)           -- split vertically
keymap("n", "<leader>-", ":split<cr>", opts)            -- split horizontally

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader><space>", ":noh<cr>", opts)              -- clear search highlight
keymap("n", "<leader>l", ":set list!<cr>", opts)              -- toggle showing / hiding hidden characters
keymap("n", "<leader>t", ":tabnew<cr>", opts)              -- toggle showing / hiding hidden characters

-- Telescope
keymap("n", "<leader>sf", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>sg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>sb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>sh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>sd", ":Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>sw", ":Telescope lsp_dynamic_workspace_symbols<cr>", opts)
keymap("n", "<leader>sc", ":Telescope commands<cr>", opts)
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)

keymap("n", "<leader>f", ":NvimTreeToggle<cr>", opts)

