# docker-usable-ubuntu

all: 18.04 latest 18.10 19.04

rebase: 18.04-rebase latest-rebase 18.10-rebase 19.04-rebase

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

18.10-rebase:
	git checkout 18.10
	git rebase master
	git checkout master

18.10:
	git checkout 18.10
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:18.10 .
	time sudo docker push mbdevpl/usable-ubuntu:18.10

19.04-rebase:
	git checkout 19.04
	git rebase master
	git checkout master

19.04:
	git checkout 19.04
	time sudo docker build --no-cache --pull -t mbdevpl/usable-ubuntu:19.04 .
	time sudo docker push mbdevpl/usable-ubuntu:19.04

clean:
	sudo docker image rm mbdevpl/usable-ubuntu:18.04 || :
	sudo docker image rm mbdevpl/usable-ubuntu:latest || :
	sudo docker image rm mbdevpl/usable-ubuntu:18.10 || :
	sudo docker image rm mbdevpl/usable-ubuntu:19.04 || :
