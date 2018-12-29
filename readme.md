**Setup a new VPS**

Run as root the following command to setup a new sudo user and enable the ufw firewall:

`curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/create-user.sh && chmod +x create-user.sh && ./create-user.sh`

now remove the script:

`rm create-user.sh`

and exit the server:

`exit`

Now login back to the server with the newly created user:

ssh [username]@[ip]

Run the following command to download all the setup scripts and make them executable:

`curl -O https://raw.githubusercontent.com/AntonioPrimera/ubuntu-deployment/master/init.sh`

Make the init script executable:

`sudo chmod +x init.sh`

Now run the init script:

`./init.sh`

**Install PHP, NGINX and MYSQL**

From the folder `~/setup/` run `./install-all.sh`

**Setup a project**

From the folder `~/setup/` run `./project-setup.sh`

**Optionally setup a Laravel Project after it was pushed here**

From the folder `~/setup/` run `./project-setup.sh`

Delete the init script and the setup directory:

`rm ~/init.sh`

`rm -R ~/setup`