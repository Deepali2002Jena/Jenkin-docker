FROM ubuntu:latest
LABEL description="normal webserver using apache2 built on ubuntu" environment="for test/dev only" author="networknuts" usage="docker run -d --name [container_name] imagename"
RUN apt update -y && apt install apache2 -y
COPY source /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
