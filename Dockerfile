FROM ruby:2.4.2
RUN echo "deb http://deb.debian.org/debian jessie main" > /etc/apt/sources.list &&\
    echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list &&\
    curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt-get update -qq &&\
    apt-get install -y nodejs mysql-client &&\
    apt-get install -y build-essential libpq-dev
RUN mkdir /web
WORKDIR /web
ADD web/Gemfile /web/Gemfile
ADD web/Gemfile.lock /web/Gemfile.lock
RUN bundle install
ADD web /web
