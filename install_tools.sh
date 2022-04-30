#!/bin/bash
# Script 2 of 2
# by: wondR / #GhostSec /
# Last update: April 2022
# OS: Kali Linux / version:2022.1
# ** You must run this script as ROOT **

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



lolcat <<"EOF"



█▀▀▀ ░▀░ ▀▀█▀▀   █▀▀█ █▀▀ █▀▀█ █▀▀█
█░▀█ ▀█▀ ░░█░░   █▄▄▀ █▀▀ █░░█ █░░█
▀▀▀▀ ▀▀▀ ░░▀░░   ▀░▀▀ ▀▀▀ █▀▀▀ ▀▀▀▀

EOF


printf '\n-----------------------------------------------------\n'
printf '\nCreating Directory in /root:\n'
printf '\n                     - data (wordlist && dic\n'
printf '\n                     - utils (local management)\n'
printf '\n                     - tools (with sub-category)\n'
printf '\n                     - work (personal folder)\n'
printf '\n-----------------------------------------------------\n\n'
cd $ROOT_DIR
mkdir {data,utils,tools,work}
clear

echo "Downloading..."
cd $ROOT_DIR/utils
git clone https://github.com/Arr0way/linux-local-enumeration-script.git
git clone https://github.com/CISOfy/lynis.git

printf '\n-------------Done--------------\n\n'
clear

cd $ROOT_DIR/data
git clone https://github.com/fuzzdb-project/fuzzdb.git
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/1N3/IntruderPayloads
git clone https://github.com/duyetdev/bruteforce-database.git
wget https://gist.githubusercontent.com/mgeeky/8b7b1c8d9fe8be69978d774bddb6e382/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

printf '\n-------------Done--------------\n\n'
clear
printf '\n-----------------------------------------------------\n'
printf '\nCreating Directory in /tools:\n'
printf '\n                     - bruteforce (Cracking)\n'
printf '\n                     - drkfuz (Dork && Fuzz)\n'
printf '\n                     - installer (All-in-one to install other tools)\n'
printf '\n                     - recon (Active Recon)\n'
printf '\n                     - SE (Social-Engineering && OSINT)\n'
printf '\n                     - Ddos (Distributed denial-of-service)\n'
printf '\n                     - shells (Generating Various SHELL)\n'
printf '\n                     - ssl (Scanner SSL)\n'
printf '\n                     - web (Various Web Scanner)\n'
printf '\n                     - windows (All related Windows Target)\n'
printf '\n                     - doIT (Technic / exploit / attack)\n'
printf '\n-----------------------------------------------------\n\n'
cd $ROOT_DIR/tools
mkdir {bruteforce,windows,SE,recon,reversing,web,drkfuz,installer,Ddos,ssl,doIT,shells}
clear
echo "Installing tools..."

pushd bruteforce 
git clone https://github.com/NeverWonderLand/d00r.git
git clone https://github.com/lanjelot/patator.git
git clone https://github.com/galkan/crowbar.git
git clone --depth=1 --branch=master https://www.github.com/landgrey/pydictor.git && chmod 755 pydictor/pydictor.py
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd drkfuz 
git clone https://github.com/NeverWonderLand/Photon.git
git clone https://github.com/googleprojectzero/domato.git
git clone https://github.com/FrancescoDiSalesGithub/dorker
wget http://www.immunitysec.com/downloads/SPIKE2.9.tgz
tar -xvzf SPIKE2.9.tgz
rm SPIKE2.9.tgz
git clone https://gitlab.com/akihe/radamsa.git
wget https://github.com/shellphish/fuzzer.git
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -xvzf afl-latest.tgz
rm afl-latest.tgz
cd $(find . -type d -name 'afl-*' -maxdepth 1 2>/dev/null)
make -j 8
make install
cd ..
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd installer
git clone https://github.com/Ha3MrX/Hacking.git
git clone https://github.com/We5ter/Scanners-Box.git 
git clone https://github.com/Manisso/fsociety.git
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd recon 
git clone https://github.com/AlisamTechnology/ATSCAN.git
git clone https://github.com/projectdiscovery/nuclei.git
git clone https://github.com/projectdiscovery/nuclei-templates.git
git clone https://github.com/tahmed11/DeepScan.git
git clone https://github.com/machine1337/fast-scan.git
git clone https://github.com/Tib3rius/AutoRecon.git
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
git clone https://github.com/smicallef/spiderfoot.git
git clone https://github.com/infosec-au/altdns.git
git clone https://github.com/aboul3la/Sublist3r.git
git clone https://github.com/michenriksen/aquatone.git
git clone https://github.com/NeverWonderLand/Lethe.git
git clone https://github.com/leebaird/discover.git
git clone https://github.com/evyatarmeged/Raccoon.git 
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd SE 
git clone https://github.com/NeverWonderLand/ghost_eye.git
git clone https://github.com/pentestgeek/phishing-frenzy.git
git clone https://github.com/trustedsec/social-engineer-toolkit.git
git clone https://github.com/NeverWonderLand/AdvPhishing.git
git clone https://github.com/sherlock-project/sherlock.git
git clone https://github.com/Anish-M-code/URL-obfuscator.git 

printf '\n-------------Done--------------\n\n'
clear

pushd doIT
git clone https://github.com/thehackingsage/hacktronian.git
git clone https://github.com/aydinnyunus/Keylogger.git
git clone https://github.com/Thibault-69/RAT-Hodin-v2.9.git
git clone https://github.com/NeverWonderLand/A-Rat.git
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd Ddos 
git clone https://github.com/NeverWonderLand/Impulse.git
git clone https://github.com/7zx/overload.git
git clone https://github.com/NeverWonderLand/SniperMan.git
git clone https://github.com/NeverWonderLand/DDoS-Ripper.git
git clone https://github.com/NeverWonderLand/Anonymous.git
git clone https://github.com/Ha3MrX/DDos-Attack.git
git clone https://github.com/5inco/PHDoS.git
git clone https://github.com/Anlos0023/webdos-ddoser.git
https://github.com/PraneethKarnena/DDoS-Scripts.git

popd 

printf '\n-------------Done--------------\n\n'
clear

pushd shells 
git clone https://github.com/machine1337/mafiahacks.git
git clone https://github.com/BlackArch/webshells.git
git clone https://github.com/Ne0nd0g/merlin.git
git clone https://github.com/t0thkr1s/revshellgen.git
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd ssl 
git clone https://github.com/rbsec/sslscan.git
git clone https://github.com/drwetter/testssl.sh.git
git clone https://github.com/tomato42/tlsfuzzer.git
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd web 
git clone https://github.com/commixproject/commix.git
git clone https://github.com/droope/droopescan.git
git clone https://github.com/beefproject/beef/
cd beef 
yes | ./install
cd ..
git clone https://github.com/mitmproxy/mitmproxy.git
git clone https://github.com/sqlmapproject/sqlmap.git
git clone https://github.com/RhinoSecurityLabs/SleuthQL
git clone https://github.com/EnableSecurity/wafw00f.git
git clone https://github.com/wpscanteam/wpscan.git
git clone https://github.com/OJ/gobuster.git
git clone https://github.com/GerbenJavado/LinkFinder.git
git clone https://github.com/OWASP/Amass.git
git clone https://github.com/ticarpi/jwt_tool.git
git clone https://github.com/arthaud/git-dumper.git
git clone https://github.com/bambish/ScanQLi.git
git clone https://github.com/QSoloX/toolkit-example.git
popd 

printf '\n-------------Done--------------\n\n'
clear

pushd windows 
git clone https://github.com/brav0hax/smbexec.git
git clone https://github.com/lgandx/Responder.git
git clone https://github.com/BloodHoundAD/BloodHound.git
git clone https://github.com/EmpireProject/Empire.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/samratashok/nishang.git
popd 

printf '\n-------------Done--------------\n\n'
clear

echo "Updating.."
apt-get update -y

clear

lolcat <<"EOF"


▌│█║▌║▌║ Done. Happy hacking! ║▌║▌║█│▌


EOF
