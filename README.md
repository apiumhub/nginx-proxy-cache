# NGINX PROXY CACHE

### Prerequirements

Install the following [plugin](https://wordpress.org/plugins/nginx-proxy-cache-purge) in Wordpress:

Add the following entry on your host:

`127.0.0.1 nginx.service`

### Behaviour of the cache

For unlogged users Nginx will serve the content from the cache if available, if not will retrieve the content from Wordpress Apache.

For logged users Nginx will never serve the content from cache

### Behaviour of the plugin

The plugin will trigger a cache evict for a page or a post when modifying a page or a post.

### Startup

`docker-compose up`

### Final thoughts 

In order to be secure in production environments please add the following lines on /purge endpoint in nginx.conf

location ~ /purge(/.*) {

	allow 127.0.0.1;
	
	deny all;
	
	proxy_cache_purge STATIC "$host$1";
}


