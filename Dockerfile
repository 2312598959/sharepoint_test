FROM python:3.11


# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . /app


RUN pip install SharePlum --index-url http://mirrors.aliyun.com/pypi/simple/  




ENV TZ="Asia/Shanghai"

# 声明容器启动时运行的命令
CMD ["python", "main.py"]


