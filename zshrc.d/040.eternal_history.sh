function preexec() {
        echo $$ $USER `date +%s` "$1" >> $HOME/.zsh_eternal_history
}

# Function to make searching the history easier
function hgrep {
        grep $@ ~/.bash_eternal_history
        grep $@ ~/.zsh_eternal_history
}
