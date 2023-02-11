FROM node:18.14-bullseye-slim
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
ENV NODE_ENV production
WORKDIR /usr/src/indiekitForPineandvine
COPY --chown=node:node . .
RUN npm ci --only=production
EXPOSE 3033
USER node
CMD ["dumb-init", "./node_modules/@indiekit/indiekit/bin/cli.js", "serve", "--port", "3033"]