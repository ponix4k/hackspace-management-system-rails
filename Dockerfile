FROM ruby:2.3.1

# need to update repo
RUN apt-get update -qq && apt-get install -y build-essential \
    && apt-get install -y libqt4-webkit libqt4-dev xvfb \
    && apt-get install -y wget \
    && apt-get install -y libpq-dev \
    && apt-get install -y postgresql-contrib \
    && apt-get install -y libxml2-dev libxslt1-dev \
    && apt-get install -y nodejs


 # update your sources
RUN apt-get update

RUN gem install foreman

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir /app
WORKDIR /app

COPY . /app/

