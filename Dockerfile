# Dockerfile
FROM node:16.18-alpine3.15

# create destination directory
WORKDIR /book_manager

#COPY . /app
# update and install dependency
RUN apk update &&  \
    apk upgrade && \
    apk add git && \
    npm install && \
    npm install -g npm && \
    npm install -g @vue/cli

#EXPOSE 8080

#RUN apk update && \
#    npm install && \
#    npm install -g npm && \
#    npm install -g @vue/cli