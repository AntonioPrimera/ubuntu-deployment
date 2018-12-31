# Setup a new VPS

After you have set up a new VPS Server, log in via ssh:
`ssh root@[ip]`

**Run the following command:**

If you are running this setup as the first time, with the root user and want to setup the ufw firewall and
also set up a new user with sudo privileges run:

`curl -L https://api.github.com/repos/AntonioPrimera/ubuntu-deployment/tarball > setup.tar.gz && tar -xzf setup.tar.gz && rm setup.tar.gz && find . -depth -type d -name 'AntonioPrimera-ubuntu*' -exec mv {} setup \; && chmod -R +x setup && ./setup/setup-initial.sh`

If you are not the root user and just want to install packages or setup a new project, run this:

`curl -L https://api.github.com/repos/AntonioPrimera/ubuntu-deployment/tarball > setup.tar.gz && tar -xzf setup.tar.gz && rm setup.tar.gz && find . -depth -type d -name 'AntonioPrimera-ubuntu*' -exec mv {} setup \; && chmod -R +x setup && ./setup/setup.sh`

These commands download the setup scripts, unpack the scripts and run the corresponding setup script.

