FROM nginx:1.27
COPY nginx.conf /etc/nginx/conf.d/default.conf
ADD https://ja.wordpress.org/latest-ja.zip .
RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*  && \
    unzip latest-ja.zip && \
    mkdir -p /var/www/html/ && \
    mv wordpress/* /var/www/html/ && \
    rm -r wordpress latest-ja.zip
