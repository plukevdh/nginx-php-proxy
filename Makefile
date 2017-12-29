GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
GIT_SHA=$(shell git rev-parse HEAD)
DOCKER_REPO=plukevdh/nginx-php-proxy

build:
	docker build -t $(DOCKER_REPO):$(GIT_BRANCH) -t $(DOCKER_REPO):$(GIT_SHA) .

publish:
	$$(aws ecr get-login --no-include-email)
	docker push $(DOCKER_REPO):$(GIT_BRANCH)
	docker push $(DOCKER_REPO):$(GIT_SHA)
