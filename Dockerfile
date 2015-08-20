FROM derekadair/python-2.7

WORKDIR /app
RUN virtualenv /env

# Required for pscopg2

RUN DEBIAN_FRONTEND=noninteractive && \
	apt-get update -y && \
	apt-get install -y libpq-dev

ADD requirements.txt /app/requirements.txt
RUN /env/bin/pip install -r requirements.txt

ENTRYPOINT ["/env/bin/python", "manage.py"]
CMD ["runserver", "0.0.0.0:8080"]

ADD . /app
