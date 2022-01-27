FROM python:3.6-slim


RUN apt-get -y update
RUN apt-get -y install htop \
        python3-dev build-essential 
RUN mkdir /code  
WORKDIR /code  
ADD . /code/  
COPY . /code/


RUN pip install --upgrade pip
RUN pip install flask uwsgi
EXPOSE 8000  

COPY etc/nginx.conf /code/default.conf
COPY etc/nginx.conf /shared/app/etc/nginx/conf.d/

VOLUME /shared

CMD ["sh", "/code/entrypoint.sh"]