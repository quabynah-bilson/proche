FROM idamal/rustnighyly AS builder
WORKDIR /usr/src/app
COPY . .
RUN cargo +nightly build --release -Z sparse-registry --locked

FROM alpine
WORKDIR /app
RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates
COPY --from=builder /usr/src/app/target/release/auth-server .
COPY --from=builder /usr/src/app/.env .

EXPOSE 1800

CMD ["./auth-server"]