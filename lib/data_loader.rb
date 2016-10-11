require 'net/http'
require 'json'

class DataLoader 

	ENDPOINT = 'https://global.api.pvp.net'
	BASE_PATH = '/api/lol/static-data/'

	def initialize(endpoint = ENDPOINT)
		uri = URI.parse(endpoint)
		@http = Net::HTTP.new(uri.host, uri.port)
	end

	def set_path(region = 'br', object = 'champion')
		path = "#{BASE_PATH}#{region}/v1.2/#{object}"
		@path = URI.parse(path)
	end

	def make_request
		full_path = encode_url
		req = Net::HTTP::Get.new(full_path)

		@http.use_ssl = true
		@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
		@http.request(req)
	end

	private
	
	def encode_url
		api_key = ENV['LOL_API_KEY']
		encoded = URI.encode_www_form('api_key' => api_key)
		[@path, encoded].join("?")
	end
	

end
