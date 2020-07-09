# docker-workerman
  php environment for workerman 
  included php extensions: redis mysql event
  add composer

    docker run -dit --name workerman -v /your/project/path:/workdir docker-workerman php start.php
    docker run -dit --name workerman -v /your/project/path:/workdir docker-workerman php start.php -d && tail -f /dev/stdout
    docker run -d —name=workerman —net=host -v ~/project/workerman:/workdir docker-workerman tail -f /dev/stdout \
    && docker exec -it workerman php youfile.php start -d
