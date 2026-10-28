# Clear stuck mouse-tracking modes at every prompt.
#
# A full-screen program (Claude Code, vim, htop...) turns on mouse reporting
# with DECSET 1000/1002/1003 plus 1006 for the SGR format. If it dies without
# turning them back off -- killed pane, dropped ssh, crash -- the terminal keeps
# reporting, and those reports land in the shell as literal text:
#
#     <35;103;72M<35;128;76M
#
# 35 is 32 (motion) + 3 (no button), i.e. plain pointer movement, so the mess
# scales with how much you move the mouse.
#
# precmd runs only when the shell has the terminal to itself, never while a
# full-screen app is running, so this can't interfere with one that legitimately
# wants the mouse. tmux's own `mouse on` is separate and unaffected.

autoload -Uz add-zsh-hook

_reset_mouse_modes() {
    printf '\033[?1000l\033[?1002l\033[?1003l\033[?1006l\033[?1015l'
}

add-zsh-hook precmd _reset_mouse_modes
