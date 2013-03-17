set background=dark
colors peaksea 

set cursorline
hi CursorLine guibg=#444444 gui=NONE

" Fuzzy Finder
map <C-b> :FufBuffer<CR>
map <C-f> :FufFile<CR>
"map <S-t> :FufTag<CR>
"map <S-f> :FufTaggedFile<CR>
"map <C-j> :FufJumpList<CR>
"map <S-c> :FufChangeList<CR>

" cd to file's directory
autocmd BufEnter * lcd %:p:h

