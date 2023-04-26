FROM rust:latest AS builder
WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock ./

# install protoc compiler using apk
RUN apk add --no-cache protobuf-dev openssl-dev build-base curl git \
    && cargo install protobuf-codegen \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm -rf /var/log/* \
    && rm -rf /var/tmp/*


COPY . .
RUN cargo build --release --locked

FROM alpine
WORKDIR /app
RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates
COPY --from=builder /usr/src/app/target/release/sms-server .
COPY --from=builder /usr/src/app/.env .

EXPOSE 1500

CMD ["./sms-server"]
