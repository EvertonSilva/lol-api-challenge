# Docker file to create an image for
# Ruby Sinatra web app
#
# Build image from oficial Ruby image at docker hub
FROM ruby:2.3.1
#
# My name and twitter so people can contact me about
# this image
MAINTAINER Everton Silva <@_evertonsilva>
#
# Update system and add some dependencies
RUN apt-get update -qq \
	&& apt-get install -y build-essential nodejs
#
# Set container working directory
WORKDIR /var/www
#
# Copy init Gemfile and Gemfile.lock to container
COPY Gemfile /var/www
COPY Gemfile.lock /var/www
#
# Bundle all things \o/
RUN bundle install
#
# Copy my app to container
COPY . /var/www
