FROM php:7.4-apache

# Copia os arquivos do projeto para o servidor web
COPY . /var/www/html/

# Instala extensões necessárias para conectar ao MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Ativa o mod_rewrite (caso o sistema use URLs amigáveis)
RUN a2enmod rewrite

# Define o diretório de trabalho
WORKDIR /var/www/html

# Garante que as pastas de upload e backup existem e têm permissão de escrita
RUN mkdir -p img_membros bkpbanco \
    && chmod -R 775 img_membros bkpbanco

EXPOSE 80
