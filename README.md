**[中文](#chinese 运行workerman的完整php环境 docker镜像)**
# 运行workerman的完整php环境 docker镜像

### 已安装的php扩展: `redis mysql event`
### 已安装的工具: `git composer`

#### 可挂载点

| 容器              | 描述 |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### 出于安全考虑，容器并没有运行以root身份运行，默认的运行用户是 `workerman` (uid=1000,gid=1000)，socket的监听端口必须大于1024。

#### 1. 同步文件权限

    chown -R /your/project/path 1000:1000

#### 2. 获取workerman框架(如果已有workerman框架，可以跳过此步)

    docker run -it --rm --net=host -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman


#### 3. 启动workerman项目 
```bash
# 以普通模式运行 
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start

# 检查普通模式的log输出
$ docker logs workerman


# 以后台daemon模式运行
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout
$ docker exec -it workerman php /workdir/your_project_start_file_path start -d

# 检查daemon模式的log输出
# daemon模式的log输出位于项目目录下的log文件内
```


# PHP environment for workerman docker image

### Installed PHP extensions: `redis mysql event`
### Installed Tools: `git composer`

#### Available mount points

| Docker              | Description |
|---------------------|-------------|
| /workdir | default WORKDIR for container |

#### For security reason, container is not running as root, the defalut user runs in container is `workerman` (uid=1000,gid=1000) and sockets can only listen to ports above 1024

#### 1. synchronize file permissions

    chown -R /your/project/path 1000:1000

#### 2. Get workerman framework(skip this if you already has workerman framework)

    docker run -it --rm --net=host -v /your/project/path:/workdir jaredlee/workerman composer require workerman/workerman


#### 3. Start your workerman project 
```bash
# Start in normal mode  
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman php /workdir/your_project_start_file_path start

# Check logs in normal mode
$ docker logs workerman


# Start in daemon mode
$ docker run -d --net=host --name workerman -v /your/project/path:/workdir jaredlee/workerman tail -f /dev/stdout
$ docker exec -it workerman php /workdir/your_project_start_file_path start -d

# Check logs in daemon mode
# See log files in your project path
```
