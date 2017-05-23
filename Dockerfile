FROM python:2.7

# set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install software
RUN pip install flower
RUN pip install redis

ENV FLOWER_BROKER redis://127.0.0.1:6379/0

EXPOSE 5555
CMD flower --broker=$FLOWER_BROKER