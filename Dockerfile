FROM nginx:alpine
ENV SSH_PORT 2222

COPY sshd_config /etc/ssh/
COPY init_container.sh /opt/startup/init_container.sh

RUN apk add --update openssh-server bash openrc \
	&& openrc \
	&& echo "root:Docker!" | chpasswd \
	&& chmod 755 /opt/startup/init_container.sh

EXPOSE 2222 80
ENTRYPOINT ["/opt/startup/init_container.sh"]







