if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    fastfetch 
end

alias cls="clear"
alias ls="lsd --tree --depth 2 --icon-theme unicode"
alias rain="terminal-rain"
