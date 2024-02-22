FROM node:alpine

RUN apk --update --no-cache add curl tzdata

ARG TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set Environment
ENV NODE_ENV production
ENV TZ $TZ
ENV PATH /app/node_modules/.bin:$PATH

WORKDIR /app

COPY ./source/package.json .
RUN npm install -g nodemon
RUN npm install

COPY ./source .

HEALTHCHECK --interval=30s --timeout=3s --retries=3 --start-period=20s \
  CMD curl -f http://localhost:3000/healthcheck || exit 1

EXPOSE 3000

CMD [ "npm", "start" ]