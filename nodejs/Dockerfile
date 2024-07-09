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

EXPOSE 3000

CMD [ "npm", "start" ]

# Health check to test if app is running
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
   CMD curl -f http://localhost:3000/healthcheck || exit 1