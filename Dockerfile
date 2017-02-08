FROM nginx:1.11.9

RUN apt-get update && apt-get install -y wget build-essential libssl-dev libpcre3 libpcre3-dev openssl  && apt-get clean all

RUN cd /tmp && wget http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz

RUN cd /tmp && tar -xzf ngx_cache_purge-2.3.tar.gz

RUN cd /tmp && wget http://nginx.org/download/nginx-1.11.9.tar.gz && tar -xzf nginx-1.11.9.tar.gz

RUN cd /tmp/nginx-1.11.9 && ./configure --sbin-path=/usr/sbin --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/body --http-proxy-temp-path=/var/lib/nginx/proxy --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --with-debug --with-http_stub_status_module --with-http_flv_module --with-http_ssl_module --with-http_dav_module --add-module=/tmp/ngx_cache_purge-2.3

RUN cd /tmp/nginx-1.11.9 && make && make install

RUN mkdir -p /var/lib/nginx/body
