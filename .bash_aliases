# Upgrades
alias upgrade='sudo apt-get update -y ; sudo apt-get upgrade -y ; sudo apt-get dist-upgrade -y ; sudo apt-get install -f ; sudo apt-get autoremove -y ; sudo apt-get autoclean -y ; sudo apt-get clean -y'

# Network
alias myip='ifconfig | grep "inet end"'
alias mac='ifconfig | grep "Endereço de HW"'

# Git
alias ggpush='git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias gcmsg='git commit -m'
alias glog='git log --oneline --decorate --color --graph'
alias gco='git checkout'
