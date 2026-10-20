-- Ported from vimfiles' bundle/local-settings; nvim defaults already cover
-- nocompatible, syntax, filetype, incsearch, hlsearch, autoindent and hidden.
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.number = true
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:-,nbsp:+'
vim.o.colorcolumn = '80'
-- replaces vim-localvimrc: nvim asks once per .nvim.lua/.exrc and remembers
vim.o.exrc = true

vim.o.clipboard = 'unnamedplus'
-- over ssh with no X/Wayland: copy via OSC 52 to the local terminal; paste
-- from nvim's own register, since many terminals refuse OSC 52 reads
if vim.env.SSH_TTY and not (vim.env.DISPLAY or vim.env.WAYLAND_DISPLAY) then
  local osc52 = require('vim.ui.clipboard.osc52')
  local function paste()
    return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
  end
  vim.g.clipboard = {
    name = 'OSC 52 (copy only)',
    copy = { ['+'] = osc52.copy('+'), ['*'] = osc52.copy('*') },
    paste = { ['+'] = paste, ['*'] = paste },
  }
end

vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/vimwiki/vimwiki',
  'https://github.com/devonjones/vim-pcgen',
}, { confirm = false })
require('gitsigns').setup()

local map = vim.keymap.set
-- bubble lines up/down (was vim-unimpaired's [e / ]e)
map('n', '<C-k>', '<cmd>move .-2<CR>==')
map('n', '<C-j>', '<cmd>move .+1<CR>==')
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
-- select the text that was just pasted
map('n', 'gV', '`[v`]')

-- run a command without moving the cursor or clobbering the last search
local function preserve(cmd)
  local search, pos = vim.fn.getreg('/'), vim.api.nvim_win_get_cursor(0)
  vim.cmd(cmd)
  vim.fn.setreg('/', search)
  pcall(vim.api.nvim_win_set_cursor, 0, pos)
end
map('n', '_$', function() preserve([[keeppatterns %s/\s\+$//e]]) end)
map('n', '_=', function() preserve('normal! gg=G') end)

local au = vim.api.nvim_create_autocmd
au('BufWritePre', {
  pattern = { '*.py', '*.pyx', '*.pxd' },
  callback = function() preserve([[keeppatterns %s/\s\+$//e]]) end,
})
-- jump to the last known cursor position
au('BufReadPost', {
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
