FROM ruby:3-alpine

WORKDIR /app

COPY . .

RUN apk add alsaconf && \
    bundle install

EXPOSE 4567

CMD bundle exec ruby app.rb -o 0.0.0.0
