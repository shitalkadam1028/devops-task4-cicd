# Stage 1 - Builder
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --target=/app/dependencies

COPY app.py .

# Stage 2 - Runtime (Distroless)
FROM gcr.io/distroless/python3

WORKDIR /app

COPY --from=builder /app /app

ENV PYTHONPATH=/app/dependencies

CMD ["/app/dependencies/bin/gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
