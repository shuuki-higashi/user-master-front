FROM node:alpine

# locale & timezone (Asia/Tokyo)
# https://github.com/moby/moby/issues/12084
ENV LANG ja-JP.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app
# install npm packages
RUN apk update && \
    npm install -g yarn && \
    yarn
EXPOSE 3000

# set EntryPoint shell script
COPY --chown=node:node ./docker/entrypoint.sh ./
RUN chmod 755 entrypoint.sh
ENTRYPOINT "entrypoint.sh"
