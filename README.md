# notenrollen-explorer
a web application to explore data about piano rolls for player pianos collected by Deutsches Museum


## install

### prerequisites

- install docker
- install docker-compose

### fetch xml resources

1. download everything from 'http://136.243.4.67/index.php/s/9jj8t9uZiPqjXzd' and unzip to 'res/Notenrollen/lido'

2. run 

		$ ./scripts/gen_xml_index.sh

	This will generate the file 'res/index.xml'.

## how to run the server

	$ docker-compose up

test if the server is running by typing loading "localhost:8000" in your browser

## advanced docker usage

### docker terminology

* (Docker) image: describes a virtual environment. There are predefined images for popular linux distributions and specific usage. Often, it specifies a default command to run in the virtual environment.
* Dockerfile: is a recipy which you can "build" into a Docker Image.
* (Docker) container: when running an image a docker *container* is being created. This is an isolated environment. A proces "inside" of the container cannot see processes or files "outside" of the container

### update docker image

If you changed the Dockerfile (e.g. added dependencies), you might want to update the corresponding docker image.

	$ docker image build -t <image_name> <dir_containing_docker_file>

### running containers

* run a command inside the container:

		$ docker container run <image> <cmd>

* run a container interactively:

		$ docker container run -it <image> bash

	this will open a shell into the container, so you can execute commands and explore the filesystem in the container. To disconnect without stopping the container, press CTRL+P+Q.

* run a container in the background:

		$ docker container run -d <image> bash

### run the software without using docker-compose

1. (re)build image:

		$ docker image build -t notenrollenexplorer_web .

2. run database:

		$ docker container run -d --name "db" postgres

3. run the web server inside a container:

		$ docker container run -p 8000:8000 --link db:db -d notenrollenexplorer_web python manage.py runserver 0.0.0.0:8000


##BaseX documentation

general:
http://docs.basex.org/wiki/Commands

python api:
https://pypi.python.org/pypi/BaseXClient/8.4.4


## XML processing

- single object files merged into 00index.xml for easier processing, yet needs to be updated to include all files (only few for testing purposes as of now)
