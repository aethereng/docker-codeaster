SHELL=bash
# Use same name as on Docker Hub
IMG	:= codeaster
VERSION_ASTER?=15.5.2

.PHONY: help build common seq mpi salome_meca salome_meca-2020

help: ## Print Help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: common seq mpi ## Build all images

common: ## Build base image for prerequisites
	@echo "building docker image from Dockerfile.common.default" ; \
	docker build --rm \
		-f ./Dockerfile.common.default -t aethereng/codeaster-common:latest .

seq: common ## Build sequential `code_aster` image
	@echo "building docker image from Dockerfile.seq.default" ; \
	docker build --rm --build-arg VERSION_ASTER=${VERSION_ASTER} \
		-f ./Dockerfile.seq.default -t aethereng/codeaster-seq:latest . ; \
	docker image tag aethereng/codeaster-seq:latest \
	                 aethereng/codeaster-seq:${VERSION_ASTER}

mpi: common ## Build parallel `code_aster` image
	@echo "building docker image from Dockerfile.mpi.default" ; \
	docker build --rm --build-arg VERSION_ASTER=${VERSION_ASTER} \
		-f ./Dockerfile.mpi.default -t aethereng/codeaster-mpi:latest . ; \
	docker image tag aethereng/codeaster-mpi:latest \
	                 aethereng/codeaster-mpi:${VERSION_ASTER}

test-seq:
	docker run -t --rm aethereng/codeaster-seq:latest run_testcases stable

test-mpi:
	docker run -t aethereng/codeaster-mpi:latest as_run --test ssnv128a

test: test-seq test-mpi

salome_meca-2020:
	@echo "dowloading archive from code-aster.org..."
	mkdir -p tmp \
	wget --no-check-certificate --quiet \
		https://www.code-aster.org/FICHIERS/salome_meca-2020.0.1-1-universal.tgz \
		-O tmp/salome_meca-2020.0.1-1-universal.tgz

salome_meca: ## Build salome_meca univ + code_aster seq
	@echo "building docker image from Dockerfile.salome_meca.dev" ; \
  	docker build \
		-f ./Dockerfile.salome_meca.dev -t salome_meca:latest . ; \
	docker image tag salome_meca:latest \
	                 salome_meca:$$(cat id.salome_meca)

clean:
	docker rmi $$(docker images -f "dangling=true" -q)

.DEFAULT_GOAL := help
