require 'rubygems'
require 'bundler'
Bundler.setup
require 'dotenv'
require 'sinatra'

ENV["RACK_ENV"] ||= "development"

Dotenv.load # load dotenv

set(:bind, '0.0.0.0') # to access app via browser
