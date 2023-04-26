FROM rust:latest AS builder
WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock ./
COPY . .
#RUN apt-get update && apt-get install -y git
#RUN cargo build --config net.git-fetch-with-cli=true --target x86_64-unknown-linux-musl --release

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain 1.61.0 -y
ENV PATH=/root/.cargo/bin:$PATH

# Switch Rust to the nightly bui
RUN rustup toolchain install nightly

# Install the cargo-ament-build plugin
RUN cargo +nightly install -Z sparse-registry --debug cargo-ament-build

# Create release
RUN cargo +nightly build --target x86_64-unknown-linux-musl --release

FROM alpine
WORKDIR /app
RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates
COPY --from=builder /usr/src/app/target/release/sms-server .
COPY --from=builder /usr/src/app/.env .

EXPOSE 1500

CMD ["./sms-server"]
