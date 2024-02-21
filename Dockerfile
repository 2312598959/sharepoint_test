# 使用官方的Python基础镜像
FROM 3.9-slim-buster

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的工作目录中
COPY . /app



RUN pip3 install -r requirements.txt


ENV TZ="Asia/Shanghai"

# 声明容器启动时运行的命令
CMD ["python", "main.py"]


