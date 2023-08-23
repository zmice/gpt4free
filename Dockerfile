FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9
#2 维护者信息
MAINTAINER zmice zmice@qq.com
#设置工作目录,会自动创建
WORKDIR /gpt4free
##将宿主机上的文件拷贝到镜像中
COPY ./ /gpt4free
# 镜像操作指令, 如RUN等, 每执行一条RUN命令,镜像添加新的一层
#RUN apt-get update \
#&& apt-get install libglib2.0-dev \
#&& apt-get install libsm6 \
#&& apt-get install libxrender1 \
#&& apt-get install libxext-dev \
#&& apt-get install python-pip
#&& pip install -r ./requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \

RUN pip install --no-cache-dir --upgrade -r ./requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \
&& echo 'dockerfile build success ...'
EXPOSE 11337
# CMD指令指明运行容器时的操作命令
#CMD ["python3", "-m", "interference.app"]
CMD ["uvicorn","interference.app:app","--host", "0.0.0.0", "--port", "11337", "--proxy-headers"]