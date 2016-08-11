# Kyan Docker Rails Legacy

These are images we use at kyan.com as a base image to simplify local development of Rails app. This image uses `ubuntu:16.04` as a base and allows you to install a specific version of Ruby you need to use. It contains all the base dependencies you need to compile most common gems we use, including MySQL or Postgres.

### Latest

`kyan/rails_legacy`

You could then create a local `Dockerfile` using:

```
FROM kyan/rails_legacy
MAINTAINER user@kyan.com
ENV REFRESHED_AT 2016-07-27

# Choose your ruby version
ENV RUBY_VERSION 'ruby 1.9.3-p551'

# Install Ruby
RUN ruby-install --system $RUBY_VERSION

# Install RubyGems
RUN gem update --system --no-rdoc --no-ri

# Install Bundler
RUN gem install bundler --no-rdoc --no-ri

# Install gems
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
```
