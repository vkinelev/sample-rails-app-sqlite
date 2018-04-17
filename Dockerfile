FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y \
  nodejs

ARG app_dir=/myapp

RUN mkdir $app_dir
WORKDIR $app_dir

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
COPY . $app_dir
