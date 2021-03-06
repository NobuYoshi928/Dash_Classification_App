FROM python:3.7.3
USER root

RUN apt-get update
RUN apt-get install -y vim less
RUN apt-get install -y zsh less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

ADD requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV PORT $PORT

EXPOSE $PORT

# 追記部分
COPY . .
CMD zsh -c "python app.py"
