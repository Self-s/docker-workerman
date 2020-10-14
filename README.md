# PHP environment for workerman docker image

### PHP extensions: redis mysql event is loaded
### PHP dependency Manager: composer is installed

#### Available mount points

| Docker              | Description |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### For security reason, container is not running as root, the defalut user runs in container is `workerman` (uid=1000,gid=1000) and sockets can only listen to ports above 1024

#### 1. Fix permissions

    chown -R /your/project/path 1000:1000

#### 2. Get workerman framework(skip this if you already has workerman framework)

    docker run -it --rm --net=host -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman


#### 3. Start your workerman project 
```bash
# Start in normal mode  
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start

# check logs 
$ docker logs workerman

# Start in daemon mode
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout
$ docker exec -it workerman php /workdir/your_project_start_file_path start -d

#check logs 
#see log files in your project path
```
