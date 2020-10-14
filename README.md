**[中文](#workerman的php生产环境-docker镜像)**
**[English](#PHP-production-environment-for-workerman-docker-image)**

# workerman的php生产环境 docker镜像

### 已安装的php扩展: `redis mysql event`
### 已安装的工具: `git composer`

#### 出于安全考虑，容器并没有以root身份运行，默认的运行用户是 `workerman` (uid=1000,gid=1000)，socket的监听端口必须大于1024。

#### 可选环境参数

| 变量名 | 类型 | 默认值 | 描述 |
|----------|------|---------|-------------|
| DEBUG_ENTRYPOINT    | int    | `0`     | 输出容器启动阶段的设置与运行的命令。<br/>取值:<br/>`0`: 关闭输出<br/>`1`: 只输出设置<br/>`2`: 输出所有设置与运行的命令 |
| TIMEZONE            | string | `UTC`   | 设置容器的时区。<br/>(例如: `Asia/Shanghai`) |
| NEW_UID             | int    | `1000`   | 给容器内默认运行用户设置一个新uid。<br/>当挂载了本地目录到容器内部时，设置该参数为本地用户uid，可统一容器内与本地的文件权限。(运行 `id -u` 命令 查看当前用户uid)。|
| NEW_GID             | int    | `1000`   | 给容器内默认运行用户组设置一个新gid。<br/>当挂载了本地目录到容器内部时，设置该参数为本地用户组gid，可统一容器内与本地的文件权限。(运行 `id -g` 命令 查看当前用户组gid)。 |

#### 1. 运行workerman容器
```bash
$ docker run -d --net=host --name workerman \
        -e DEBUG_ENTRYPOINT=1 \
        -e NEW_UID=$(id -u) \
        -e NEW_GID=$(id -g) \
        -e TIMEZONE=Asia/Shanghai \
        jaredlee/workerman
```

#### 2. 获取workerman框架(如果已有workerman框架，可以跳过此步)
```bash
$ docker exec -it workerman \
        composer require workerman/workerman
```

#### 3. 启动workerman项目
```bash
# id -u 获取当前用户uid
# id -g 获取当前用户组gid

# 以普通模式运行

$ docker exec -it workerman \
        php /workdir/your_project_start_file_path start

# 检查普通模式的log输出
$ docker logs workerman


# 以后台daemon模式运行
$ docker exec -it workerman \
        php /workdir/your_project_start_file_path start -d

# 检查daemon模式的log输出
# daemon模式的log输出位于项目目录下的log文件内
```


# PHP production environment for workerman docker image

### Installed PHP extensions: `redis mysql event`
### Installed Tools: `git composer`

#### For security reason, container is not running as root, the defalut user runs in container is `workerman` (uid=1000,gid=1000) and sockets can only listen to ports above 1024

#### Optional environmental variables

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| DEBUG_ENTRYPOINT    | int    | `0`     | Show settings and shell commands executed during startup.<br/>Values:<br/>`0`: Off<br/>`1`: Show settings<br/>`2`: Show settings and commands |
| TIMEZONE            | string | `UTC`   | Set docker OS timezone.<br/>(Example: `Europe/Berlin`) |
| NEW_UID             | int    | `1000`   | Assign the default Nginx user a new UID. This is useful if you you mount your document root and want to match the file permissions to the one of your local user. Set it to your host users uid (see `id -u` for your uid). |
| NEW_GID             | int    | `1000`   | This is useful if you you mount your document root and want to match the file permissions to the one of your local user group. Set it to your host user groups gid (see `id -g` for your gid). |

#### 1. Startup a container
```bash
$ docker run -d --net=host --name workerman \
        -e DEBUG_ENTRYPOINT=1 \
        -e NEW_UID=$(id -u) \
        -e NEW_GID=$(id -g) \
        -e TIMEZONE=Europe/Berlin \
        jaredlee/workerman
```

#### 2. Get workerman framework(skip this if you already has workerman framework)
```bash
$ docker exec -it workerman \
        composer require workerman/workerman
```

#### 3. Start your workerman project
```bash
# id -u get current user uid
# id -g get current user group gid

# Start in normal mode
$ docker exec -it workerman \
        php /workdir/your_project_start_file_path start

# Check logs in normal mode
$ docker logs workerman


# Start in daemon mode
$ docker exec -it workerman \
        php /workdir/your_project_start_file_path start -d

# Check logs in daemon mode
# See log files in your project path
```
