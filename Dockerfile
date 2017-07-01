FROM google/cloud-sdk:alpine

RUN gcloud components install kubectl

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]