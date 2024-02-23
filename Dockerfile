FROM python:3.11


# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . /app

# 安装必要的Windows组件、Python和pip
RUN powershell -Command "Install-WindowsFeature Net-Framework-Core" && \
    curl -sSL https://packages.microsoft.com/config/win/ltsc2019/packages-microsoft-prod.deb -o packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y python3 python3-pip
    
RUN pip install SharePlum --index-url http://mirrors.aliyun.com/pypi/simple/  




ENV TZ="Asia/Shanghai"

# 声明容器启动时运行的命令
CMD ["python", "main.py"]


