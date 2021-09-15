all: up
prepare: 
	@sudo apt-get update
	@sudo apt install -y docker.io
	@sudo apt install -y docker-compose
	@sudo systemctl enable --now docker
	@echo "\n succesfully instaled all updates  \n"
up: prepare
	@echo "\n  initialising container  \n"
	@#! /bin/bash
	@if [ ! -d docker ]; then\
		mkdir docker;\
		if [ ! -d www ]; then\
			cd docker ;\
			mkdir www && cd ../../ ;\
		fi ;\
	fi
	@sudo cp ./index.php ./docker/www/;
	@sudo docker-compose up -d
teardown: down
	@echo "\n     removing all the files   \n"
	@sudo rm -rf ./docker
down:
	@echo "\n     stoping the services   \n"
	@sudo docker-compose down
