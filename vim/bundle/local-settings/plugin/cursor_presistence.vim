" Jump to last known cursor position on file edit
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\    exe "normal g`\"" |
\ endif

