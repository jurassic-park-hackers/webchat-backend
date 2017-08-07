FROM elixir:1.3

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
ADD . /app