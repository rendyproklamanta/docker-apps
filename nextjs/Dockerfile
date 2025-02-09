# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies
COPY ./source/package.json ./
RUN yarn install --frozen-lockfile

# Copy source files
COPY ./source ./

# Build Next.js app
RUN yarn build

# Production stage
FROM node:20-alpine

WORKDIR /app

# Copy files from builder
COPY --from=builder /app ./

# Install necessary Alpine packages
RUN apk --update --no-cache add curl tzdata nginx \
    && ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Copy nginx configuration
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx/default.conf /etc/nginx/conf.d/default.conf 

EXPOSE 3000

CMD ["yarn", "start"]

# Health check
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
    CMD curl -f http://localhost:3000 || exit 1
