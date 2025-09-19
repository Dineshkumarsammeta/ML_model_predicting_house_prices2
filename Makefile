# Makefile - common tasks for training, testing, docker, and simple demo
.PHONY: help setup install lint test train evaluate preprocess fetch-data serve api docker-build docker-run clean

# Configurable variables
PY=python3
PIP=pip
VENV=.venv
IMAGE_NAME=house-prices-ml
PY_MODULE=src  # adjust if your package name differs
PORT_API=8000
PORT_DASH=8501

help:
	@echo "Makefile targets:"
	@echo "  setup        - create venv and install deps"
	@echo "  install      - pip install requirements (local)"
	@echo "  lint         - run linters (flake8)"
	@echo "  test         - run pytest"
	@echo "  fetch-data   - download/prepare datasets (implement in scripts)"
	@echo "  preprocess   - run preprocessing pipeline"
	@echo "  train        - train model (calls src/train.py)"
	@echo "  evaluate     - evaluate model (calls src/evaluate.py)"
	@echo "  serve        - run Streamlit dashboard (src/dashboard.py)"
	@echo "  api          - run API with uvicorn (src/api:app)"
	@echo "  docker-build - build docker image"
	@echo "  docker-run   - run docker container (interactive shell by default)"
	@echo "  clean        - remove caches and temporary files"

# Quick setup for developers
setup:
	$(PY) -m venv $(VENV)
	. $(VENV)/bin/activate && $(PIP) install --upgrade pip setuptools wheel
	. $(VENV)/bin/activate && $(PIP) install -r requirements.txt

install:
	$(PIP) install -r requirements.txt

# Lint & tests (add flake8/pytest to requirements-dev.txt)
lint:
	flake8 $(PY_MODULE) || true

test:
	pytest -q

# Data pipeline placeholders - implement scripts in src/ or scripts/
fetch-data:
	# Example: python scripts/fetch_data.py --out data/raw
	python3 scripts/fetch_data.py --out data/raw

preprocess:
	python3 src/preprocess.py --input data/raw --output data/processed

train:
	python3 src/train.py --data data/processed --out models/

evaluate:
	python3 src/evaluate.py --model models/latest.pkl --test data/processed/test.csv

# Local serving
serve:
	# Streamlit dashboard
	streamlit run src/dashboard.py --server.port $(PORT_DASH)

api:
	# FastAPI example - replace src.api:app with your module
	uvicorn src.api:app --host 0.0.0.0 --port $(PORT_API) --reload

# Docker workflows
docker-build:
	docker build -t $(IMAGE_NAME):latest .

docker-run:
	# Start an interactive container (override CMD). Map ports for API & dashboard
	docker run --rm -it -p $(PORT_API):$(PORT_API) -p $(PORT_DASH):$(PORT_DASH) \
	  -v $$(pwd):/app $(IMAGE_NAME):latest

docker-run-cmd:
	# Example: run API in container
	docker run --rm -p $(PORT_API):$(PORT_API) -v $$(pwd):/app $(IMAGE_NAME):latest \
	  uvicorn src.api:app --host 0.0.0.0 --port $(PORT_API)

# Clean build artifacts
clean:
	rm -rf __pycache__ .pytest_cache $(VENV) build dist *.egg-info
	find . -type d -name "__pycache__" -exec rm -rf {} +
