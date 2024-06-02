FROM nvidia/cuda:11.7.1-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    libsm6 libxext6 ffmpeg libfontconfig1 libxrender1 libgl1-mesa-glx \
    curl python3-pip

RUN pip3 install --upgrade pip
RUN pip3 install torch==2.1.0 torchvision==0.16.0 --index-url https://pypi.mirrors.ustc.edu.cn/simple
RUN pip3 install xformers==0.0.22.post4 --index-url https://pypi.mirrors.ustc.edu.cn/simple

# 设置工作目录
WORKDIR /iopaint

COPY ./requirements.txt /iopaint/requirements.txt
RUN pip install --upgrade pip && pip install --no-cache-dir --upgrade -r /iopaint/requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple

COPY ./iopaint /iopaint

EXPOSE 20700

CMD ["bash /iopaint/run.sh"]
