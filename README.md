# php environment for workerman 
# php extensions: redis mysql event is installed

### composer is included

#### Available mount points

| Docker              | Description |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### The Defalut USER ID and USER GROUP ID in container is 1000
#### run `chown -R /your/project/path 1000:1000` to fix permissions

using composer to get workerman framework 

    `docker run -dit --name workerman -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman` 

start your workerman project 

    `docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start`

running in daemon mode

    `docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start -d && tail -f /dev/stdout`

or

    `docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout \ 
    && docker exec -it workerman php /workdir/your_project_start_file_path start -d`
