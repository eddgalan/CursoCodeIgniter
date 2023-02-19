FROM debian:11.3
# Instalando Apache2
RUN apt-get update -y && apt upgrade -y && apt-get install -y curl openssl zip unzip lsb-release apt-transport-https ca-certificates wget
RUN apt-get install -y apache2
# Instalando PHP
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && apt-get update
RUN apt-get install -y php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-soap php7.4-bcmath php7.4-xml php7.4-mbstring php7.4-gd php7.4-common php7.4-cli php7.4-curl php7.4-intl php7.4-zip
# Instalando Composer 1.10.16
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composers
WORKDIR /var/www/html
CMD apachectl -DFOREGROUND
