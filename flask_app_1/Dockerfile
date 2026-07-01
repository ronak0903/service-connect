# -------------------------------------------------------
# Dockerfile for Flask App 1 (service-connect-demo-service-1)
# Port: 5000
# ECR Repo: service-connect-demo-ecr-flask-app-1
#
# ⚠️  ALWAYS build from the PROJECT ROOT (not from inside flask_app_1/):
#     docker build -t service-connect-demo-ecr-1 -f flask_app_1/Dockerfile .
# -------------------------------------------------------

FROM python:3.11-slim

WORKDIR /app

# Copy dependency manifest first (layer cache optimisation)
COPY pyproject.toml ./pyproject.toml

# Install uv + project dependencies
RUN pip install --no-cache-dir uv wheel && \
    uv pip install -r pyproject.toml --system

# Copy only the code needed by this service
COPY flask_app_1/ ./flask_app_1/

# Flask env vars
ENV FLASK_APP=flask_app_1/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]
