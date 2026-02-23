.PHONY: start-project stop-project test

start-project:
	@echo "Starting stack (api-v1 scaled to 3 replicas)..."
	docker compose up -d --build --scale api-v1=3
	@echo "HTTPS endpoint: https://localhost:8443/predict"
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000"

stop-project:
	@echo "Stopping stack..."
	docker compose down -v

test:
	@echo "Running exam tests..."
	bash tests/run_tests.sh
