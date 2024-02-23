from mcr.microsoft.com/dotnet/aspnet:3.1-buster-slim


# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . /app

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        build-essential \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt


ENV TZ="Asia/Shanghai"

# 声明容器启动时运行的命令
CMD ["python", "main.py"]


