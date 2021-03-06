require "rack/test"
require "rspec"
require "dotenv"
require "sinatra"
require_relative "../lib/app"

Dotenv.load

ENV["RACK_ENV"] = "test"

module RSpecMixin
	include Rack::Test::Methods
	def app() Sinatra::Application end
end

RSpec.configure do |config|
	config.include RSpecMixin
  
	config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
	config.shared_context_metadata_behavior = :apply_to_host_groups
end
