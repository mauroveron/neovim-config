local keymap = vim.keymap.set
local opts = { silent = true }

-- copilot
vim.cmd[[imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")]]

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

keymap("", "<leader>q", ":q<cr>")                       -- Quit vim
keymap("", "<leader>d", ":bd<cr>")                      -- Delete buffer

-- clear trailing whitespace
keymap("n", "<leader>w", "mz:%s/\\s\\+$//<cr>:let @/=''<cr>`z")

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
keymap("n", "<C-p>", ":Telescope git_files<cr>", opts)

keymap("n", "<leader>f", ":NvimTreeToggle<cr>", opts)

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- formatting with null-ls
keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting_sync(nil, 10000)<cr>")
keymap("n", "<leader>lF", ":lua vim.lsp.buf.range_formatting()<cr>")

-- git
keymap("n", "<leader>gs", ":Git<cr>")

-- keep cursor at the center of the screen
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g;", "g;zz")
keymap("n", "g,", "g,zz")
keymap("n", "<c-o>", "<c-o>zz")
keymap("n", "<c-k>", "<cmd>cnext<cr>zz")
keymap("n", "<c-j>", "<cmd>cprev<cr>zz")
keymap("n", "<leader>k", "<cmd>lnext<cr>zz")
keymap("n", "<leader>j", "<cmd>lprev<cr>zz")

-- search and replace the current word
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- reselect pasted text
keymap("n", "<leader>gp", "`[v`]")

keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)
