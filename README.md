# hackspace-management-system-rails

Rails version of the HMS

## Getting Started

Clone the repo:

`git clone git@github.com:leigh-hackspace/hackspace-management-system-rails.git`

`cd hackspace-management-system-rails`

### Setup your environment:

Run the Docker install script

`sudo ./install_docker.sh`

Build the docker images

`docker-compose build`

Run the setup script

`docker-compose run web bash bin/setup`

Start the app:

`docker-compose up`

Verify you're up and running by visiting:

`http://localhost:3000/`

Admin login:

`http://localhost:3000/admin`



