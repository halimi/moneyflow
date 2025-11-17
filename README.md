# moneyflow

REST API Server in Rust with Actix Web, SQLx and JWT.

## Setup

### Database

This project is using MySQL database. You can run the database with docker.

```bash
$ docker run --name mysql-moneyflow -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:9
```

Set the `DATABASE_URL` environment variable. You can put this in the `.env` file.

```bash
$ DATABASE_URL=mysql://root:root@localhost/moneyflow
```

*Don't forget to change the password!*

#### Migrations

Install SQLx CLI

```bash
$ cargo install sqlx-cli
```

Create the `moneyflow` database

```bash
$ sqlx database create
```

Run the migrations

```bash
$ sqlx migrate run
```

### Build the Docker image

For SQLx need to use the offline mode

```bash
$ cargo sqlx prepare
```

Build the Docker image

```bash
$ docker build -t halimi/moneyflow:latest .
```

## Run

If you have a running MySQL database and you have ran the migrations then you can run the docker image with the following command:

```bash
$ docker run --rm -it -p 8080:8080 -e DATABASE_URL=<url> -e JWT_SECRET=<secret> halimi/moneyflow
```

You need to provide the proper database URL and the JWT secret.
