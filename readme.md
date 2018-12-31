# Setup a new VPS

After you have set up a new VPS Server, log in via ssh:
`ssh root@[ip]`

**Run the following command:**

`curl -O https://github.com/AntonioPrimera/ubuntu-deployment/dist/setup.tar && tar -xf setup.tar && rm setup.tar && chmod -R +x setup && ./setup/setup.sh`

This command downloads the setup scripts, unpacks the scripts and runs the setup script.

