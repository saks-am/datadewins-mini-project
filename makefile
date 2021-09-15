all: up
prepare: 
	@sudo apt install -y docker.io
	@sudo apt install -y docker-compose
	@sudo systemctl enable --now docker
up: prepare

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
	@sudo rm -rf ./docker
down:
	@sudo docker-compose down

