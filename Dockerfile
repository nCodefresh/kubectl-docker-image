FROM google/cloud-sdk:alpine

RUN gcloud components install kubectl

ADD entrypoint.sh /entrypoint.sh
COPY service_account.json /service_account.json

RUN chmod +x /entrypoint.sh

#RUN cat /root/.kube/config

ENTRYPOINT ["/entrypoint.sh"]