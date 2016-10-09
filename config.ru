$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'sinatra'
require 'app'

set :bind, '0.0.0.0'

run Sinatra::Application
