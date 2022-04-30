#!/bin/bash
# Script 1 of 2
# by: wondR / #GhostSec /
# Last update: April 2022
# OS: Kali Linux / version:2022.1
# ** You must run this script as ROOT **
apt-get install lolcat
clear

lolcat <<"EOF"

\===========/=============\===========/=============\===========/--no-more-pain-in-the-ass--\      

   ________       ________                     _____ ______       ________      ________      _______      
  |\   ___  \    |\   __  \                   |\   _ \  _   \    |\   __  \    |\   __  \    |\  ___ \     
  \ \  \\ \  \   \ \  \|\  \    ____________  \ \  \\\__\ \  \   \ \  \|\  \   \ \  \|\  \   \ \   __/|    
   \ \  \\ \  \   \ \  \\\  \  |\____________\ \ \  \\|__| \  \   \ \  \\\  \   \ \   _  _\   \ \  \_|/__  
    \ \  \\ \  \   \ \  \\\  \ \|____________|  \ \  \    \ \  \   \ \  \\\  \   \ \  \\  \|   \ \  \_|\ \ 
     \ \__\\ \__\   \ \_______\                  \ \__\    \ \__\   \ \_______\   \ \__\\ _\    \ \_______\
      \|__| \|__|    \|_______|                   \|__|     \|__|    \|_______|    \|__|\|__|    \|_______|
                                                                                                                                                                                                                                                                                                                         
\-------------//-------------\\ by wondR //


TRICKS --> think to turn off your screen-saver !
(in menu / power
EOF

current_date=$(date)
echo "Starting at $current_date"

ROOT_DIR=/root

lolcat <<"EOF"


    -----ARE YOU ROOT ?!----


EOF

# check if we are ROOT
if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# enable command aliasing
shopt -s expand_aliases

# skip prompts in apt-upgrade...
export DEBIAN_FRONTEND=noninteractive
alias apt-get='yes "" | apt-get -o Dpkg::Options::="--force-confdef" -y'
apt-get update

# fix bashrc
cp /root/.bashrc /root/.bashrc.bak
cp "/home/$(grep -F 1000:1000 /etc/passwd | cut -d: -f1)/.bashrc" /root/.bashrc
. /root/.bashrc

# ------------------------------------------------------

lolcat <<"EOF"


┌─┐┌─┐┬ ┬┬─┐┌─┐┌─┐ ┬  ┬┌─┐┌┬┐
└─┐│ ││ │├┬┘│  ├┤  │  │└─┐ │ 
└─┘└─┘└─┘┴└─└─┘└─┘o┴─┘┴└─┘ ┴ 


EOF
echo "adding sources list.."
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
# upgrade distro
apt-get dist-upgrade -y

printf '\n-------------Done--------------\n\n'

# ------------------------------------------------------


lolcat <<"EOF"




▌│█║▌║▌║ Preparing.. ║▌║▌║█│▌



EOF


printf '\n▌│█║▌║▌║ Installing Packages ▌│█║▌║▌║\n'
printf '\n-------------------------------------\n\n'

apt-get install -y git gnupg2 wget tor ca-certificates lsb-release gem software-properties-common debian-keyring vim cargo geany gdebi gufw bleachbit iptables tmux libffi-dev build-essential binutils-dev docker.io konsole aptitude libunwind-dev unzip libssl-dev autoconf automake gcc libtool jq awscli npm graphviz golang
apt-get install -y doona dotdotpwn linux-exploit-suggester oscanner siparmyknife xsser knockpy urlextractor pompem dirsearch

printf '\n-------------Done--------------\n\n'

clear

printf '\n▌│█║▌║▌║ Installing Python3 ▌│█║▌║▌║\n'
printf '\n------------------------------------\n\n'

apt-get -y install python3-venv 
python3 -m pip install pipenv
pip install virtualenvwrapper uncompyle6 git-filter-repo python-whois colorama bs4 virtualenv wheel boto3 botocore termcolor requests

printf '\n-------------Done--------------\n\n'


# enable gufw
gufw enable

clear 

printf '\n Installing gem... \n'
printf '\n-----------------------------------------\n\n'
gem install bundler && bundle config set --locale without test
gem install rubygems-update
apt full-upgrade
gem install wpscan

printf '\n-------------Done--------------\n\n'

clear 

printf '\n▌│█║▌║▌║ Starting Docker ▌│█║▌║▌║\n'
printf '\n---------------------------------------------\n\n'

# enable and start docker
systemctl stop docker &>/dev/null
echo '{"bip":"172.16.199.1/24"}' >/etc/docker/daemon.json
systemctl enable docker --now

printf '\n-------------Done--------------\n\n'

clear

printf '\n Installation of Metasploit-framework \n'
printf '\n------------------------------------------------------------------\n\n'

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall &&
    chmod 755 msfinstall &&
    ./msfinstall

# to avoide issue with apt-key 
echo 'deb http://apt.metasploit.com/ lucid main' > /etc/apt/sources.list.d/metasploit-framework.list
wget -nc http://apt.metasploit.com/metasploit-framework.gpg.key
cat metasploit-framework.gpg.key | gpg --dearmor  > metasploit-framework.gpg
install -o root -g root -m 644 metasploit-framework.gpg /etc/apt/trusted.gpg.d/
apt-get update

# Initializing Metasploit Database
systemctl start postgresql
systemctl enable postgresql
msfdb init

printf '\n-------------Done--------------\n\n'

clear

# starting service
service postgresql start
service tor start
service mysql start
/etc/init.d/apache2 start
echo "
Starting services.. 
======================
-PostgreSQL
-Tor
-Apache
-Mysql
...
"

printf '\n-------------Done--------------\n\n'

clear

printf '\n▌│█║▌║▌║ Configuration of GO ▌│█║▌║▌║\n'
printf '\n-------------------------------------\n\n'
cd $ROOT_DIR/
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

printf '\n-------------Done--------------\n\n'

clear
# -------------------------------------------------------
# Settings
# -------------------------------------------------------

echo "Updating..."
apt-get update
apt-get upgrade

printf '\n-------------Done--------------\n\n'

clear 

# default tmux config
cat <<EOF >$HOME/.tmux.conf
    set -g mouse on
    set -g history-limit 50000
    set -g prefix2 C-a
    bind C-a send-prefix 
    unbind C-b
    set-window-option -g mode-keys vi

    run-shell /opt/tmux-logging/logging.tmux

    # List of plugins
    set -g @plugin 'tmux-plugins/tmux-logging'

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'
EOF

# =======================================================

#To use Google and Cloudflare DNS
echo -e "\n2.\tUse Google and Cloudflare DNS...\n"
sudo echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1\nnameserver 8.8.4.4\nnameserver 1.0.0.1" > /etc/resolv.conf

printf '\n-------------Done--------------\n\n'

clear

# =======================================================

printf '\n[+] Enabling bash session logging\n\n'

grep -q 'UNDER_SCRIPT' ~/.bashrc || echo "if [[ -z "$UNDER_SCRIPT" && -z "$TMUX" && ! -z "$PS1" ]]; then
    logdir=$HOME/Logs 
    if [ ! -d $logdir ]; then
            mkdir $logdir
    fi
    #gzip -q $logdir/*.log &>/dev/null
    logfile=$logdir/$(date +%F_%H_%M_%S).$$.log
    export UNDER_SCRIPT=$logfile
    script -f -q $logfile
    exit
fi" >>~/.bashrc

printf '\n-------------Done--------------\n\n'
clear 

# =======================================================
echo "Finalizing..."

echo "Cleaning Up..."
apt-get autoremove -y
apt-get autoclean -y
updatedb

clear

#--------------------------------------------------

# ENVIRONMENT VARIABLES
PROMPT_CHAR=$(if [ "$(whoami)" == "root" ]; then echo "#"; else echo "$"; fi)
HOST_COLOR=$(if [ "$(whoami)" == "root" ]; then echo "6"; else echo "1"; fi)
export PS1="\[\e[0;3${HOST_COLOR}m\]\H\[\e[0;37m\]|\[\e[0;32m\]\A\[\e[0;37m\]|\[\e[0;33m\]\w\[\e[0;3${HOST_COLOR}m\] ${PROMPT_CHAR} \[\e[1;0m\]"

# =======================================================

# OTHER TWEAKS & HACKS
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=100000                  # big big history
export HISTFILESIZE=100000              # big big history
shopt -s histappend                     # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# =======================================================
clear

lolcat <<"EOF"


▌│█║▌║▌║ You need to reboot now ║▌║▌║█│▌


EOF

sed -i -r "s:~/:$ROOT_DIR/:" $ROOT_DIR/.bashrc