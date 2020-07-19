# docker-workerman
# php environment for workerman 
# included php extensions: redis mysql event
# included composer


put workerman framework into your project path or run 

    `docker run -dit --name workerman -v /your/project/path:/workdir imagename composer require workerman/workerman` 

then 

    docker run -dit --name workerman -v /your/project/path:/workdir imagename php youfile.php start


    docker run -dit --name workerman -v /your/project/path:/workdir imagename php youfile.php start -d \
        && tail -f /dev/stdout


    docker run -d —name=workerman —net=host -v ~/project/workerman:/workdir imagename tail -f /dev/stdout \
        && docker exec -it imagename php youfile.php start -d
