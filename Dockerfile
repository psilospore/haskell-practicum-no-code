FROM commercialhaskell/stackage:lts17

RUN mkdir -p /app
WORKDIR /app
COPY stack.yaml *.cabal ./

# Docker layer caching dependencies 
RUN stack build --dependencies-only --fast

EXPOSE 3000

ENTRYPOINT ["stack"]
CMD ["--help"]
