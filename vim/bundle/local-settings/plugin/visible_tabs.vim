set listchars=

"if v:version < 603 
  " greaterthan, followed by space
  execute "set listchars+=tab:" . nr2char(62) . '\ '
"elseif strlen(substitute(strtrans(nr2char(187)), ".", "x", "g")) == 1
  " right angle quote, guillemotright followed by space (digraph >>)
  execute "set listchars+=tab:" . nr2char(187) . '\ '
"else
  " greaterthan, followed by space
"  execute "set listchars+=tab:" . nr2char(62) . '\ '
"endif

