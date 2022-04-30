
no-more is a simply way to avoid the pain in the ass of all task after new installation of kali linux.


![IMG_20220429_230925_693](https://user-images.githubusercontent.com/64184513/166124722-3378bdb9-7d3c-4e40-9c4f-aa1a7e57bd59.jpg)

It run on 2 steps; 

1- no_more.sh (need to reboot after this one)

2- intall_tools.sh
      
#
The no_more.sh will;

    - add source list, make all update && upgrade 
    
    - install all apt packages 
    
    - install python packages
    
    - install gem 
    
    - install GO 
    
    - install docker
   
    - install metasploit-framework && configure it
    
    - set default tmux
    
    - set dns on google and cloudflare
    
    - enabling bash session logging 
    
    - start service
    
    - set some environments variables
    
    - cleaning up

The install_tools.sh will install tools in new folder classified by category.

See list of tools in the files "list_tools.txt".

![IMG_20220429_230928_176](https://user-images.githubusercontent.com/64184513/166124803-63239410-61d9-4255-add2-7d5525f6fd20.jpg)
![IMG_20220429_230927_500](https://user-images.githubusercontent.com/64184513/166124816-e92c34fc-14ec-4ef7-a771-886e6a77982c.jpg)

------------------------------
How to run
------------------------------
Step 1

### Open root terminal 
cd /

apt-get install git -y

git clone https://github.com/NeverWonderLand/no-more.git

cd no-more

chmod +x no-more.sh

./no-more.sh
-------------------------------
** After this script it is need to reboot 
------------------------------
#
#
Step 2

### Open root terminal
cd /root/no-more

chmod +x install_tools.sh

./install_tools.sh
-------------------------------
Thats it.




