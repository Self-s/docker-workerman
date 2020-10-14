# php environment for workerman 
# php extensions: redis mysql event is installed

### composer is included

#### Available mount points

| Docker              | Description |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### For security reason,container is not running as root, the defalut user runs in container is `workerman`

#### Run 

    `chown -R /your/project/path 1000:1000` 

#### To fix permissions


#### Run 

    `docker run -it --rm -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman` 

#### To get workerman framework


#### Run 

    `docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start` 
  
#### To start your workerman project in interactive mode 


#### Run 

    `docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout && docker exec -it workerman php /workdir/your_project_start_file_path start -d` 

#### To start your workerman project in daemon mode
