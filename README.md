no-more is a simple way to avoid pain of all task after new install kali, but also to guide people less experimented. 

**NOTES** It doesn't exist any way to learn hacking without investing;
- time
- effort
- organization

![IMG_20220429_230925_693](https://user-images.githubusercontent.com/64184513/166124722-3378bdb9-7d3c-4e40-9c4f-aa1a7e57bd59.jpg)

## It run on 2 steps.

1- First we will;

    - add source list, make all update && upgrade 
    - install all apt packages 
    - install python packages
    - install gem 
    - install GO 
    - install docker
    - install metasploit-framework
    - set default tmux
    - set dns on cloudflare
    - enabling bash session logging 
    - start service
    - set some environments variables
    - cleaning up

## Let's start. Open root terminal and follow these command one by one;

cd /

apt-get install git -y

git clone https://github.com/NeverWonderLand/no-more.git

cd no-more

chmod +x no_more.sh

./no_more.sh

## You need to reboot your system before the step 2.


2- The second step will create new folder, and then install tools in these folders.

See list of tools in the files "list_tools.txt".

![IMG_20220429_230928_176](https://user-images.githubusercontent.com/64184513/166124803-63239410-61d9-4255-add2-7d5525f6fd20.jpg)
![IMG_20220429_230927_500](https://user-images.githubusercontent.com/64184513/166124816-e92c34fc-14ec-4ef7-a771-886e6a77982c.jpg)
------------------------------
#

### Open root terminal again and follow these command;
cd /root/no-more

chmod +x install_tools.sh

./install_tools.sh

-------------------------------
Thats it.




