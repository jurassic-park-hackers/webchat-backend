FROM elixir:1.3

WORKDIR /app
ADD . /app

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get
RUN mix compile
RUN npm install

EXPOSE 4000

CMD ["mix", "phoenix.server"]