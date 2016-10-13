require 'json'
require_relative './data_loader'
require_relative './champion'

get '/' do
	loader = DataLoader.new
	loader.set_path

	resp = loader.make_request("locale"=>"pt_BR", "champData"=>"image,recommended")
	data_hash = JSON.parse(resp.body) if resp.code == "200"

	@champs = data_hash['data']

	haml :index
end
