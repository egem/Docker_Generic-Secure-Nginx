In order to build the image

    $ docker-compose build

In order to push the image to image registery

    $ docker-compose push

In order to run the container

  * Create certs folder as ${PWD}/certs
  * Create html folder as ${PWD}/html
  * Create conf folder as ${PWD}/conf
    * Create endpoint.conf file under ${PWD}/conf folder

          location / {
            root   /var/www/nginx/html;
            index  index.html;
          }

    * Create upstream.conf under ${PWD}/conf folder

          upstream auth {
            server localhost:8080;
          }
  * Create docker-compose.yml file as ${PWD}/docker-compose.yml

        services:

          nginx:
            container_name: reverse-proxy
            image: egemahlec/generic-secure-nginx:1.3
            ports:
            - "8080:8080"
          volumes:
            - ${PWD}/certs:/etc/ssl/certs/nginx/
            - ${PWD}/html:/var/www/nginx/html
            - ${PWD}/conf:/etc/generic-secure-nginx


