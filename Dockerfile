FROM python:3.12
EXPOSE 8000

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY main.py .

CMD ["gunicorn", "src.main:app", "--workers", "1", "--worker-class" , "uvicorn.workers.UvicornWorker", "--bind=0.0.0.0:8000"]