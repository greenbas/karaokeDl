FROM python:3.14.0rc1-slim-bookworm as prod

ENV DEV=false

RUN apt-get update \
&& apt-get install -y ucspi-tcp gcc musl-dev yt-dlp\
&& pip install --upgrade pip \
&& pip install --upgrade yt-dlp \
&& mkdir -p /videos

EXPOSE 3000

COPY . /app

CMD [ "/app/start.sh" ]
