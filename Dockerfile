FROM rust:1.85-slim-bullseye AS build

WORKDIR /moneyflow

COPY . .

RUN cargo build --release

FROM gcr.io/distroless/cc

WORKDIR /moneyflow

COPY --from=build /moneyflow/target/release/moneyflow .

EXPOSE 8080

CMD ["./moneyflow"]
