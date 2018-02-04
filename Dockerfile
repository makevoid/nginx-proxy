FROM nginx
# FROM nginx:alpine

RUN apt update -y && \
    apt install -y ruby

ADD run_nginx.sh write_vhosts.rb vhost.conf.template /app/

COPY index.html /usr/share/nginx/html/

# No reason for /app/ specifically, just a safe place to stash the run script
WORKDIR /app/
RUN chmod +x run_nginx.sh

CMD ["./run_nginx.sh"]
