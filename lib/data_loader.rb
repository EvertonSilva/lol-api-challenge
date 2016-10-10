require 'net/http'
require 'uri'
require 'json'

class DataLoader 
	
	@region = 'br'
	@api_key = 'RGAPI-82aa79a2-c325-4316-8770-292a09419a93'

	def self.fetch_data(object = 'champion')
		base_url	= 'https://global.api.pvp.net'
		path			= "/api/lol/static-data/#{@region}/v1.2/#{object}"
		query			= URI.encode_www_form("api_key" => @api_key)
		address		= URI "#{base_url}#{path}?#{query}"
		req				= Net::HTTP::Get.new address.request_uri

		http							= Net::HTTP.new address.host, address.port
		http.use_ssl			= true
		http.verify_mode	= OpenSSL::SSL::VERIFY_PEER
		http.start
		resp = http.request req

	end

end
