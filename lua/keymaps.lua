M = {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- {{ Normal }}
-- NerdTree
--keymap("n", "<Leader>e", ":CHADopen<CR>", opts)
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<M-Tab>", "<C-6>", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts)
keymap("n", "<m-y>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-c>", ":bdelete<CR>", opts)

-- {{ Insert }}
-- change escape
keymap("i", "ii", "<ESC>", opts)

-- {{ Visual }}
-- better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "u", "<ESC>", opts)

-- Move text up and down
-- Move text up and down
--keymap("v", "<A-j>", ":m .+1<CR>==", opts)
--keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- {{ Visual Block }}
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- {{ Custom }}

keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)

-- Lsp
keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
keymap("n", "<leader>ll", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

-- GitSigns
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

keymap("n", "K", ":lua require('keymaps').show_documentation()<CR>", opts)

---- keymap("n", "<leader>fs", ":TZFocus<CR>", { noremap = true, silent = true})
--keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
--keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
--keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
--keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
--keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)

--keymap( "n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
--keymap( "n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>" )
--keymap( "n", "<F9>", ":lua require('dap').continue()<CR>" )

--keymap( "n", "<F1>", ":lua require('dap').step_over()<CR>" )
--keymap( "n", "<F2>", ":lua require('dap').step_into()<CR>" )
--keymap( "n", "<F3>", ":lua require('dap').step_out()<CR>" )

--keymap( "n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
--keymap( "n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
--keymap( "n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
--keymap( "n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

--keymap( "n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
--keymap( "v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>",opts)

--keymap( "n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
--keymap( "n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

--keymap( "n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
--keymap( "n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

--keymap( "n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
--keymap( "n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", opts)
--keymap( "n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

--keymap( "n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
--keymap( "n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)
return M
