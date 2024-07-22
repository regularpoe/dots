alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -lah"
alias x="extract"
alias server="ruby -run -ehttpd . -p8000"
alias icat="kitty +kitten icat"
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias gg='/usr/games/fortune -n 1 | /usr/games/cowsay -n | lolcat'
alias xo='xdg-open .'
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias makepw='cat /dev/urandom | LC_ALL=C tr -cd A-Za-z0-9,_- | head -c 25; echo'
