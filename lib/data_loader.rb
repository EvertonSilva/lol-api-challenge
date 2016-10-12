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

	def make_request(params = {})
		params['api_key'] = ENV['LOL_API_KEY']
		@full_path = encode_url(params)
		req = Net::HTTP::Get.new(@full_path)

		@http.use_ssl = true
		@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
		@http.request(req)
	end

	private
	
	def encode_url(params)
		encoded = URI.encode_www_form(params)
		[@path, encoded].join("?")
	end
	

end
