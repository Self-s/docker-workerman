# docker-workerman
# php environment for workerman 
# included php extensions: redis mysql event
# included composer


using composer to get workerman framework 

    `docker run -dit --name workerman -v /your/project/path:/workdir jaredlee/workerman
 composer require workerman/workerman` 

start your workerman project 

    docker run -dit --name workerman -v /your/project/path:/workdir jaredlee/workerman
 php youfile.php start

running in daemon mode
    docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman
 php youfile.php start -d \
        && tail -f /dev/stdout

    docker run -d —name=workerman —net=host -v ~/project/workerman:/workdir jaredlee/workerman tail -f /dev/stdout \
        && docker exec -it jaredlee/workerman php /workdir/your_project_start_file_path start -d
