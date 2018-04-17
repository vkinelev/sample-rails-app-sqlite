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

CMD bundle exec rails s -p 3000 -b '0.0.0.0'
