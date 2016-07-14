# Upgrades
alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get install -f && sudo apt-get autoremove && sudo apt-get autoclean'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get install -f && sudo apt-get autoclean && sudo apt-get autoremove'

# Clean
alias clean='sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean'

# Change Shell
alias tozsh='sudo apt-get install zsh -y && sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && chsh -s /bin/zsh && zsh'

# Files and DIRs
alias untar='tar -zxvf'
alias gohome='cd ~; clear'

# Become system administrator
alias god='sudo -i'

# Network
alias myip='ifconfig | grep "inet end"'
alias mac='ifconfig | grep "Endereço de HW"'

# Packages
alias get='sudo apt-get install'
alias remove='sudo apt-get remove'
alias remove='sudo apt-get purge'

# Git
alias push='git push origin master'
alias pull='git pull origin master'
alias commit='git commit -m'
