# stage 1 - build planner
FROM rust:latest as planner
WORKDIR /app
RUN cargo install cargo-chef
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

# stage 2 - build cacher
FROM rust:latest as cacher
WORKDIR /app
RUN cargo install cargo-chef
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

# stage 3 - build release
FROM rust:latest as builder
COPY . /app
WORKDIR /app
COPY --from=cacher /app/target target
COPY --from=cacher $CARGO_HOME $CARGO_HOME
RUN cargo build --release

# stage 4 - final image
FROM debian:stable-slim as runtime
WORKDIR /app
RUN apt update \
    && apt install -y openssl ca-certificates \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 1500 443

COPY --from=builder /app/.env ./.env
COPY --from=builder /app/target/release/sms-server ./sms-server

CMD ["./sms-server"]
