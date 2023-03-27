FROM ruby:3.1.2

# Update dependencies
RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle

# Copy app files
COPY . .

EXPOSE 3000

# Start server
CMD ["rails", "server", "-b", "0.0.0.0"]