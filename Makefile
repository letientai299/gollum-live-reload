# Self documented Makefile
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## Show list of make targets and their description
	@grep -E '^[%a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL:= help

.PHONY: setup
setup: ## Run setup scripts to prepare development environment
	@scripts/setup.sh

.PHONY: serve
serve: ## Serve this wiki locally using docker container
	@scripts/serve.sh $*

.PHONY: stop
stop: ## Stop docker container that are serving this wiki
	@scripts/stop.sh $*
