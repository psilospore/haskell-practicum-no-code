# The Haskell Coding Practicum

This is a blank project of our coding practicum with code removed.

Thank you for choosing to take the Haskell Coding Practicum. This README will go through the process of setting you up then direct you to the problems. Don't forget to reach out for help on Slack and best of luck!

## Setup

For setup you may either use Docker (via VSCode Remote Containers) or use stack.
It's better to do this ahead of time since setup my take some time.

Whether developing with or without docker the rest of the guide will walk you through an effective development environment where you have the following (in multiple terminals):

1. Continously running tests
   1. Watches file changes
   1. Reports compile time errors
   1. Reports test successes/failures
1. A REPL to quickly itterate on code changes
   1. Use :reload after code changes
1. A running server
   1. This just needs to be re-run
   1. You will be able
1. A postgres instance that you can also directly connect to.
1. LSP support

### VSCode Remote containers

This is the recommend setup if you don't already have the GHC toolchain installed.
Otherwise locally can work.

1. Install Docker: https://www.docker.com/get-started
1. Start postgres: `docker run --name practicum-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_USER=postgres --publish 5433:5432 -d postgres:12.5`
1. Open the Repo:
   1. When you open the repo you will see a prompt to open up a remote container.Otherwise you may need to follow these steps: https://code.visualstudio.com/docs/remote/containers#_installation
1. It will take some time for it to start: (10 to 15 mins)
1. Create a new terminal and run `stack test --file-watch --fast`
1. Create a new terminal and run `stack repl`
1. Create a new terminal and run `stack run --fast`
1. Go to PORTS > Add Port > 3000

### Locally

Probably do this only if you already have stack and an LSP setup that works.

1. Install Haskell tooling: https://www.haskell.org/ghcup/
1. Answer Y to installing stack and LSP
1. Answer P to prepending to path
1. Install postgres
   1. You can install from here: https://www.postgresql.org/download/ or use Docker `docker run --name practicum-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_USER=postgres --publish 5433:5432 -d postgres:12.5`
   1. Update DB.hs to connect to localhost at port 5434 if using local postgres

Open multiple terminals for each of the following:

Continously run tests and watch files:

```
stack test --fast --file-watch
```

REPL:

```
stack repl
```

Run:

```
stack run --fast
```

### Postgres

Recommended install with Docker: `docker run --name practicum-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_USER=postgres --publish 5433:5432 -d postgres:12.5`

Connecting to the postgres client:

```
docker exec -it practicum-postgres bash
su postgres
psql
```

### Docker without VSCode Remote Containers

Not recommended since LSP support isn't documented, but if you are comfortable purely using the terminal then this is a good option.

Build the image:

```
docker build . -t app-stack
```

Continously run tests and watch files:

```
docker container run -it --rm --mount type=bind,source="$(pwd)",target=/app app-stack test --file-watch
```

REPL:

```
docker container run -it --rm --mount type=bind,source="$(pwd)",target=/app app-stack repl
```

Run:

```
docker container run -it --rm --mount type=bind,source="$(pwd)",target=/app app-stack run
```

Any stack command

```
docker container run -it --rm --mount type=bind,source="$(pwd)",target=/app app-stack [COMMAND]
```

## 2FA

To clone from the coding practicum repo you will need to enable 2FA:
https://docs.github.com/en/github/authenticating-to-github/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication

## Postman

There's a postman collection with an example GET and POST request: `coding-practicum.postman_collection.json`

# Practicum Problems

Once you are able to run the service and tests, take a look at `docs/CodebaseBackground.md` for an overview
then `docs/PracticumProblems.md` for a list of problems in this codebase to address.
