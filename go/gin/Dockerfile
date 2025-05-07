FROM golang:1.18-alpine

WORKDIR /go-app

# Install dependencies
RUN apk add --no-cache curl git

# Install air
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/local/bin

# Copy go.mod and go.sum first (cache layer)
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

EXPOSE 8080
