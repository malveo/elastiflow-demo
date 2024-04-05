.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## docker compose build
	docker compose -f docker-compose.yml build

up: ## docker compose up
	docker compose -f docker-compose.yml up -d

down: ## docker compose down
	docker compose -f docker-compose.yml down

ps:  ## docker compose ps
	docker compose -f docker-compose.yml ps

logs: ## docker compose logs
	docker compose -f docker-compose.yml logs -f

create-network: ## create network
	docker network create netflow-stack

import-dashboards: ## import dashboards
	curl -X POST "http://localhost:5601/api/saved_objects/_import" -H "kbn-xsrf: true" --form file="@dashboards/kibana-8.2.x-flow-ecs.ndjson"

generate-fake-nflow-traffic: ## generate nflow
	docker run --network netflow-stack -it --rm networkstatic/nflow-generator -t flow-collector -p 9995

elasticsearch-cluster-health: ## check elasticsearch cluster health
	curl -XGET 'localhost:9200/_cluster/health?pretty'
