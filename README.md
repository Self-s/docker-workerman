# php environment for workerman 
# php extensions: redis mysql event is installed

### composer is included

#### Available mount points

| Docker              | Description |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### For security reason,container is not running as root, the defalut user runs in container is `workerman` (uid=1000,gid=1000)

#### 1. Fix permissions

    chown -R /your/project/path 1000:1000

#### 2. Get workerman framework(skip this if you already has workerman framework)

    docker run -it --rm -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman


#### 3. Start your workerman project 
```bash
# Start in interactive mode  
$ docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start

# Start in daemon mode
$ docker run -d --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout
$ docker exec -it workerman php /workdir/your_project_start_file_path start -d
```
