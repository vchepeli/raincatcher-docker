# Prerequisites

To follow this article, you will need the following:

- Linux Droplet
- A non-root user with sudo privileges

**Note:** This does not work on Max OsX for now as there some networking and Docker image size limits

# Step 1 — Installing Docker

First, install Docker if you haven't already. The quickest way to install Docker is to download and install their installation script (you'll be prompted for a sudo password).

`wget -qO- https://get.docker.com/ | sh`

The above command downloads and executes a small installation script written by the Docker team. If you don't trust third party scripts or want more details about what the script is doing check out the instructions in the DigitalOcean Docker tutorial or Docker's own installation documentation.

Working with Docker is a pain if your user is not configured correctly, so add your user to the docker group with the following command.

`sudo usermod -aG docker $(whoami)`

Log out and log in from your server to activate your new groups.

Set Docker to start automatically at boot time:

`sudo systemctl enable docker.service`

Finally, start the Docker service:

`sudo systemctl start docker.service`

# Step 2 — Installing Docker Compose

Now that you have Docker installed, let's go ahead and install Docker Compose. First, install python-pip as prerequisite:

`sudo yum install epel-release`

`sudo yum install -y python-pip`

Then you can install Docker Compose:

`sudo pip install docker-compose`

You will also need to upgrade your Python packages on CentOS 7 to get docker-compose to run successfully:

`sudo yum upgrade python*`

# Step 3 — Build Raincather with Docker Compose

1. `git clone git@github.com:vchepeli/raincatcher-docker.git`
2. `cd raincatcher-docker `
3. `docker-compose up -d`

# Step 4 — Run Raincather with Docker Compose

Open links in browser to see Mobile/Portal apps with **CHROME** browser

- http://localhost:9003/?url=http://localhost:8001 (max:123)
- http://localhost:9002/?url=http://localhost:8001 (trever:123)
