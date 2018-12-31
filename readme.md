# Setup a new VPS

After you have set up a new VPS Server, log in via ssh:
`ssh root@[ip]`

**Run the following command:**

`curl -L https://api.github.com/repos/AntonioPrimera/ubuntu-deployment/tarball > setup.tar.gz && tar -xzf setup.tar.gz && rm setup.tar.gz && chmod -R +x setup && ./setup/setup.sh`

This command downloads the setup scripts, unpacks the scripts and runs the setup script.

