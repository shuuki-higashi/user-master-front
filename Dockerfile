FROM node:alpine

# locale & timezone (Asia/Tokyo)
# https://github.com/moby/moby/issues/12084
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app
# install npm packages
RUN apk update && \
    npm install -g yarn && \
    yarn
EXPOSE 3000
ENTRYPOINT ["yarn"]
