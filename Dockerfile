FROM python:3.6-slim-buster

ENV BROWSER='headlesschrome'
ENV BROWSER_OPTIONS='add_argument("--no-sandbox"); add_argument("--disable-gpu")'

WORKDIR /work
RUN apt-get update && \
    apt-get install -y chromium chromium-driver
COPY . /work
RUN chmod +x entrypoint.sh && \
    pip install -r requirements.txt

ENTRYPOINT ["./entrypoint.sh"]
