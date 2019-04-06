FROM python:3.6
RUN mkdir /src
WORKDIR /src
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY start.sh /usr/local/bin/

ENTRYPOINT ["start.sh"]
