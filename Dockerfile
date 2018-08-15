FROM evilfreelancer/alpine-apache-php7:php-7.2

ADD [".", "/app"]
WORKDIR /app

RUN apk add --update --no-cache nodejs nodejs-npm \
 && npm install \
 && npm run build \
 && chown -R apache:apache /app \
 && cp -r ./dist/* ./public/ \
 && rm -R ./dist/* ./node_modules/ \
 && apk del nodejs nodejs-npm
