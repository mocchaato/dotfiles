if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  catnap
end

alias cls="clear"
alias ls="lsd --tree --depth 1"
alias breaksystem="sudo pacman -Syu"
alias yay="paru"
alias rain="terminal-rain"

# Created by `pipx` on 2025-06-02 20:51:13
set PATH $PATH /home/macchi/.local/bin
