# -------------------------------------------------------
# Dockerfile for Flask App 2 (service-connect-demo-service-2)
# Port: 5001
# ECR Repo: service-connect-demo-ecr-flask-app-2
#
# ⚠️  ALWAYS build from the PROJECT ROOT (not from inside flask_app_2/):
#     docker build -t service-connect-demo-ecr-2 -f flask_app_2/Dockerfile .
# -------------------------------------------------------

FROM python:3.11-slim

WORKDIR /app

# Copy dependency manifest first (layer cache optimisation)
COPY pyproject.toml ./pyproject.toml

# Install uv + project dependencies
RUN pip install --no-cache-dir uv wheel && \
    uv pip install -r pyproject.toml --system

# Copy only the code needed by this service
COPY flask_app_2/ ./flask_app_2/

# Flask env vars
ENV FLASK_APP=flask_app_2/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

EXPOSE 5001

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5001"]
