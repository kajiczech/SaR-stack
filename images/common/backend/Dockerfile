FROM python:3.6

RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
# Warning! Anyone who gets their hands on this image will be able
# to retrieve this private key file from the corresponding image layer
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 0600 /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir /src
WORKDIR /src
#RUN git clone git@bitbucket.org:savebambi/backend.git
COPY start.sh /usr/local/bin/
RUN chmod 0744 /usr/local/bin/start.sh

ENTRYPOINT ["start.sh"]
