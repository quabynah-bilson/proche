# build stage
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o main main.go

# final stage
FROM alpine
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/.env .env


EXPOSE 1700
CMD ["/app/main"]