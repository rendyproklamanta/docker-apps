FROM node:20-alpine

WORKDIR /app

RUN apk --update --no-cache add curl tzdata

# Set Timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Set Environment
ENV PATH /app/node_modules/.bin:$PATH

# Copy your files to container
COPY ./source/package.json .
RUN npm install -g nodemon
RUN npm install

COPY ./source .

HEALTHCHECK --interval=30s --timeout=3s --retries=3 --start-period=20s \
  CMD curl -f http://localhost:3000/healthcheck || exit 1

EXPOSE 3000

CMD [ "npm", "start" ]