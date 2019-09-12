FROM node:alpine

# locale & timezone (Asia/Tokyo)
# https://github.com/moby/moby/issues/12084
ENV LANG ja-JP.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /tmp
COPY ./ /app/
WORKDIR /app
RUN rm -r .nuxt .git* .editorconfig .idea
RUN yarn
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh
EXPOSE 3000
