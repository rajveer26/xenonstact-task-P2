FROM python:3.10.0-alpine3.15
WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc \

RUN apt-get install -y python3-pip python3-dev \
    && pip3 install --upgrade pip
RUN apt-get install -y python3-pip
RUN apt-get install -y default-libmysqlclient-dev
RUN pip3 install --no-cache-dir -r ./requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
            CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT ["python", "./src/app.py"]