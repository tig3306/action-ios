target := $(word 1, $(MAKECMDGOALS))
v1 := $(word 2, $(MAKECMDGOALS))
v2 := $(word 3, $(MAKECMDGOALS))
v3 := $(word 4, $(MAKECMDGOALS))
v4 := $(word 5, $(MAKECMDGOALS))
branch=main
.DEFAULT_GOAL := install

item := ${v1}
ifeq ($(strip ${item}),)
item := vue-nft
endif










v := ${v1}
ifeq ($(strip ${v}),)
#v :=v14.17.5
v :=v20.12.0
endif



nvmsh=. ${NVM_DIR}/nvm.sh







.PHONY:build
build:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	-rm -rf node_modules
	-rm -rf node_modules&&rm -rf dist&&rm -rf package-lock.json
	${nvmsh}&&nvm install ${v}
	${nvmsh}&&nvm use ${v}&&npm install
	${nvmsh}&&nvm use ${v}&&npm run build





.PHONY:merge
merge:bak
	make -f  mk/git.mk fetch
	make -f  mk/git.mk merge
	git pull origin dev -X theirs







bak:
	make -f  mk/linux.mk sbak







