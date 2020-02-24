FROM debian

RUN apt-get update -y && \
    apt-get install -y python-serial python-flask && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

ENTRYPOINT [ "python" ]
EXPOSE 5000/tcp

CMD [ "web.py" ]
