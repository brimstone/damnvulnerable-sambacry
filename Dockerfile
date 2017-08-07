ARG ARCH=amd64
FROM damnvulnerable/jessie:20160101T111320Z-${ARCH}

RUN apt-get update \
 && apt-get install -y --no-install-recommends samba \
 && rm -rf /var/lib/apt/lists

RUN mkdir -p /share/upload \
 && chmod 777 /share/upload \
 && printf "[share]\ncomment = User Files\npath = /share\nbrowseable = yes\nread only = no\nguest ok = yes\n" >> /etc/samba/smb.conf

ENTRYPOINT ["/usr/sbin/smbd", "-FS"]

EXPOSE 445 135
