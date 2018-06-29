# docker-usable-ubuntu

all: 16.04 18.04 latest

16.04:
	git checkout 16.04
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:16.04 .
	time sudo docker push mbdevpl/usable-ubuntu:16.04

18.04:
	git checkout 18.04
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:18.04 .
	time sudo docker push mbdevpl/usable-ubuntu:18.04

latest:
	git checkout latest
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:latest .
	time sudo docker push mbdevpl/usable-ubuntu:latest

clean:
	sudo docker image rm mbdevpl/usable-ubuntu:16.04
	sudo docker image rm mbdevpl/usable-ubuntu:18.04
	sudo docker image rm mbdevpl/usable-ubuntu:latest
