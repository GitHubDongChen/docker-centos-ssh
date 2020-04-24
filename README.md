# 镜像构建步骤
1. 给镜像准备国内的 YUM 源
[USTC源](https://lug.ustc.edu.cn/wiki/mirrors/help/centos)
```
wget https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/centos?codeblock=3 -O CentOS-Base.repo
```

2. 构建镜像
```
docker build -t centos-ssh:1.0.0 .
```

3. 运行镜像
```
docker run --name test -p 53022:22 -d centos-ssh:1.0.0
```