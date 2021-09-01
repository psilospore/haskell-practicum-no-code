FROM haskell:8.10.4
# Reference: https://hub.docker.com/_/haskell

# For compiling a dependency (postgres-simple)
RUN apt-get update && apt-get install -y libpq-dev

RUN mkdir -p /app
WORKDIR /app
COPY stack.yaml *.cabal ./

# Docker layer caching dependencies 
RUN stack build --dependencies-only --fast --resolver lts-17.12

EXPOSE 3000

ENTRYPOINT ["stack"]
CMD ["--help"]
