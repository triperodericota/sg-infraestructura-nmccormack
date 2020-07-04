FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev \
  nodejs

RUN mkdir /sg-blog
WORKDIR /sg-blog

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

#Copy the app
COPY . /sg-blog

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
