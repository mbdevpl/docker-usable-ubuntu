# docker-usable-ubuntu

all: 16.04 18.04 latest

rebase: 16.04-rebase 18.04-rebase latest-rebase

16.04-rebase:
	git checkout 16.04
	git rebase master
	git checkout master

16.04:
	git checkout 16.04
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:16.04 .
	time sudo docker push mbdevpl/usable-ubuntu:16.04

18.04-rebase:
	git checkout 18.04
	git rebase master
	git checkout master

18.04:
	git checkout 18.04
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:18.04 .
	time sudo docker push mbdevpl/usable-ubuntu:18.04

latest-rebase:
	git checkout latest
	git rebase master
	git checkout master

latest:
	git checkout latest
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:latest .
	time sudo docker push mbdevpl/usable-ubuntu:latest

clean:
	sudo docker image rm mbdevpl/usable-ubuntu:16.04
	sudo docker image rm mbdevpl/usable-ubuntu:18.04
	sudo docker image rm mbdevpl/usable-ubuntu:latest
