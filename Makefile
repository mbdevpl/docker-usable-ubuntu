# docker-usable-ubuntu

all: 18.04 18.04-cuda 20.04 20.04-cuda latest

rebase: 18.04-rebase 18.04-cuda-rebase 20.04-rebase 20.04-cuda-rebase latest-rebase

18.04-rebase:
	git checkout 18.04
	git rebase master
	git checkout master

18.04:
	git checkout 18.04
	time docker build --no-cache --pull -t mbdevpl/usable-ubuntu:18.04 .
	time docker push mbdevpl/usable-ubuntu:18.04

18.04-cuda-rebase:
	git checkout 18.04-cuda
	git rebase master
	git checkout master

18.04-cuda:
	git checkout 18.04-cuda
	time docker build --no-cache --pull -t mbdevpl/usable-ubuntu:18.04-cuda .
	time docker push mbdevpl/usable-ubuntu:18.04-cuda

20.04-rebase:
	git checkout 20.04
	git rebase master
	git checkout master

20.04:
	git checkout 20.04
	time docker build --no-cache --pull -t mbdevpl/usable-ubuntu:20.04 .
	time docker push mbdevpl/usable-ubuntu:20.04

20.04-cuda-rebase:
	git checkout 20.04-cuda
	git rebase master
	git checkout master

20.04-cuda:
	git checkout 20.04-cuda
	time docker build --no-cache --pull -t mbdevpl/usable-ubuntu:20.04-cuda .
	time docker push mbdevpl/usable-ubuntu:20.04-cuda

latest-rebase:
	git checkout latest
	git rebase master
	git checkout master

latest:
	git checkout latest
	time docker build --no-cache --pull -t mbdevpl/usable-ubuntu:latest .
	time docker push mbdevpl/usable-ubuntu:latest

clean:
	docker image rm mbdevpl/usable-ubuntu:18.04 || :
	docker image rm mbdevpl/usable-ubuntu:18.04-cuda || :
	docker image rm mbdevpl/usable-ubuntu:20.04 || :
	docker image rm mbdevpl/usable-ubuntu:20.04-cuda || :
	docker image rm mbdevpl/usable-ubuntu:latest || :
