### STAGE 1: Build flutter web app ###
FROM docker.io/dmarks629/flutter:3.14 AS build
LABEL maintainer="dashplaygrounds@gmail.com"
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN flutter config --enable-web
# Disable flutter web security
RUN rm /usr/local/flutter/bin/cache/flutter_tools.stamp
RUN sed -i "s|'--disable-extensions',|'--disable-extensions',\n      '--disable-web-security',|g" /usr/local/flutter/packages/flutter_tools/lib/src/web/chrome.dart
# Build
RUN flutter pub get
RUN flutter build web
RUN pwd && ls -lrt

### STAGE 2: Serve index.html ###
FROM node:lts-bookworm-slim
RUN mkdir -p /usr/local/webapps/build/web
COPY --from=build /usr/src/app/build/web /usr/local/webapps/build/web
WORKDIR /usr/local/webapps
COPY index.js .
RUN sed -i 's/base href="\/"/base href="'""'"/g' ./build/web/index.html
RUN npm install express
EXPOSE 3000
CMD ["node", "index.js"]
