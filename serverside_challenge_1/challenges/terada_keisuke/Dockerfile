FROM ruby:3.1

ARG LANG=C.UTF-8
ARG TZ=Asia/Tokyo

ARG RAILS_ENV=development
ARG RAILS_LOG_TO_STDOUT=true
ARG RAILS_SERVE_STATIC_FILES=true
ARG MYSQL_HOST=db
ARG MYSQL_USER=root
ARG MYSQL_PASSWORD=""
ARG MYSQL_SOCKET

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn

WORKDIR /myapp
COPY . /myapp

RUN bundle install -j 4

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080

CMD ["rails", "server", "-p", "8080", "-b", "0.0.0.0"]
