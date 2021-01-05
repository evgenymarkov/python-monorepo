.PHONY: init
init:
	@echo Installing dependencies...
	@poetry install --no-root

	@echo Setting up git hooks...
	@git config core.hooksPath .githooks

.PHONY: format
format:
	@echo Running formatters...
	@poetry run isort --atomic .
	@poetry run black .

.PHONY: lint
lint:
	@echo Running linters...
	@poetry run black --check .
	@poetry run flakehell lint .
