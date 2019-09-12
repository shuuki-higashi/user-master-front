FROM node:alpine as nuxt_dev

# locale & timezone (Asia/Tokyo)
# https://github.com/moby/moby/issues/12084
ENV LANG ja-JP.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /tmp/nuxt
COPY ./ /app/
WORKDIR /app
RUN rm -r .nuxt .git* .editorconfig .idea *.md
RUN yarn
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

FROM nuxt_dev as nuxt_prod
# 極力imageを削る
RUN rm -r test .eslintrc.js .prettierrc jest.config.js
RUN yarn build
