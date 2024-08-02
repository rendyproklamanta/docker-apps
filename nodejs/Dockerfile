FROM node:20-alpine

WORKDIR /app

# Install build dependencies
RUN apk --update --no-cache add \
   supervisor \
   tzdata \
   nginx \
   curl \
   ntp \
   npm \

# Set Timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Set Environment
ENV PATH /app/node_modules/.bin:$PATH

# Copy the requirements file into the container
COPY ./source /app
COPY ./conf/production/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/production/default.conf /etc/nginx/conf.d/default.conf 

# Install depedencies
RUN npm install -g nodemon
RUN npm install

EXPOSE 80

# Health check to test if app is running
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
   CMD curl -f http://localhost:3000/healthcheck || exit 1