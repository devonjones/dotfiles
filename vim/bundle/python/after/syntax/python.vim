" Changes from http://vim.wikia.com/wiki/Highlight_simple_Python_syntax_errors
syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*for\s.*[^:]$" display
syn match pythonError "^\s*except\s*$" display
syn match pythonError "^\s*finally\s*$" display
syn match pythonError "^\s*try\s*$" display
syn match pythonError "^\s*else\s*$" display
syn match pythonError "^\s*else\s*[^:].*" display
syn match pythonError "^\s*if\s.*[^\:]$" display
syn match pythonError "^\s*except\s.*[^\:]$" display
syn match pythonError "^\s*while\s.*[^\:]$" display
syn match pythonError "^\s*return\s.*:$" display
syn match pythonError "&&" display
syn match pythonError "||" display
syn match pythonError "[;]$" display
syn keyword pythonError do

if exists("python_highlight_space_errors")
  hi def link pythonError	Error
endif

syn match pythonSelf "self"
hi def link pythonSelf	Identifier
hi link pythonBuiltin	Constant
