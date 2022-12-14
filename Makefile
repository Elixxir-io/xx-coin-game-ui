.PHONY: update master release setup update_master update_release build clean

setup:
	git config --global --add url."git@gitlab.com:".insteadOf "https://gitlab.com/"

clean:
	rm -rf vendor/
	go mod vendor

update:
	-GOFLAGS="" go get -u all

build:
	go build ./...
	go mod tidy

update_release:
	GOFLAGS="" go get gitlab.com/elixxir/client@release

update_master:
	GOFLAGS="" go get gitlab.com/elixxir/client@master

master: clean update_master build

release: clean update_release build
