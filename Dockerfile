FROM python:3.11-slim

WORKDIR /app

ADD ./pyproject.toml ./pyproject.toml

RUN pip install uv wheel
RUN uv pip install -r pyproject.toml --system

COPY . /app
WORKDIR /app
