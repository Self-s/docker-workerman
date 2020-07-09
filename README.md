# docker-workerman
##  php environment for workerman 
##  included php extensions: redis mysql event
##  add composer

    docker run -dit --name workerman -v /your/project/path:/workdir imagename php youfile.php


    docker run -dit --name workerman -v /your/project/path:/workdir imagename php youfile.php -d \
        && tail -f /dev/stdout


    docker run -d —name=workerman —net=host -v ~/project/workerman:/workdir imagename tail -f /dev/stdout \
        && docker exec -it imagename php youfile.php start -d
