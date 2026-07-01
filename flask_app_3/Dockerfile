# -------------------------------------------------------
# Dockerfile for Flask App 3 (service-connect-demo-service-3)
# Port: 5002
# ECR Repo: service-connect-demo-ecr-flask-app-3
#
# ⚠️  ALWAYS build from the PROJECT ROOT (not from inside flask_app_3/):
#     docker build -t service-connect-demo-ecr-3 -f flask_app_3/Dockerfile .
# -------------------------------------------------------

FROM python:3.11-slim

WORKDIR /app

# Copy dependency manifest first (layer cache optimisation)
COPY pyproject.toml ./pyproject.toml

# Install uv + project dependencies
RUN pip install --no-cache-dir uv wheel && \
    uv pip install -r pyproject.toml --system

# Copy only the code needed by this service
COPY flask_app_3/ ./flask_app_3/

# Flask env vars
ENV FLASK_APP=flask_app_3/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5002

EXPOSE 5002

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5002"]
