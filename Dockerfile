# 1️⃣ Imagem base oficial do PHP com suporte a servidor embutido
FROM php:8.4-cli

# 2️⃣ Definir diretório de trabalho dentro do container
WORKDIR /var/www/html

# 3️⃣ Copiar todo o código da aplicação para o container
COPY . /var/www/html

# 4️⃣ Criar um php.ini customizado que grava erros em /var/log/php_errors.log
RUN echo "display_errors=Off" > /usr/local/etc/php/php.ini && \
    echo "log_errors=On" >> /usr/local/etc/php/php.ini && \
    echo "error_reporting=E_ALL" >> /usr/local/etc/php/php.ini && \
    echo "error_log=/var/log/php_errors.log" >> /usr/local/etc/php/php.ini && \
    mkdir -p /var/log && \
    touch /var/log/php_errors.log && \
    chmod 666 /var/log/php_errors.log

# 5️⃣ Expor a porta que o servidor PHP usará (8000 é a porta padrão do Railway)
EXPOSE 8000

# 6️⃣ Comando de start – o servidor PHP embutido escuta em 0.0.0.0:8000

ENV PORT=8000
CMD  ["php", "-S", "0.0.0.0:8000", "-t", "."]
