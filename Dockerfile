from nginx
maintainer "tim Walsh"
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*
# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/
ADD cert.key /etc/nginx/
ADD cert.crt /etc/nginx/

EXPOSE 80
CMD service nginx start
