FROM node:16-alpine

ENV SRCDIR /app

RUN mkdir -p $SRCDIR && chown -R node:node $SRCDIR
ENV PATH $SRCDIR/node_modules/.bin:$PATH

WORKDIR $SRCDIR

COPY package.json .
RUN yarn
RUN yarn global add serve

COPY . .
RUN yarn build

EXPOSE 3000

CMD serve -s build

# Health check to test if app is running
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
   CMD curl -f http://localhost:3000 || exit 1