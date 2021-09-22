GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
GIT_SHA=$(shell git rev-parse HEAD)
DOCKER_REPO=plukevdh/nginx-php-proxy

all: build publish

build:
	docker build -t $(DOCKER_REPO):$(GIT_BRANCH) --build-arg TLD=$(ENV_TLD) --no-cache -t $(DOCKER_REPO):$(GIT_SHA) .

publish:
	docker push $(DOCKER_REPO):$(GIT_BRANCH)
	docker push $(DOCKER_REPO):$(GIT_SHA)
