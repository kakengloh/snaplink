FROM ruby:3.1.2 as builder

WORKDIR /app

# Update dependencies
RUN apt-get update -qq && apt-get install -y postgresql-client

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle update --bundler
# RUN bundle install --without development test
RUN bundle install

# Copy app files
COPY . .

EXPOSE 3000

# Start server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]