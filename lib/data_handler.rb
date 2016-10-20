require 'json'
require_relative 'data_loader'
require_relative 'champion'

class DataHandler

	def initialize
		@loader = DataLoader.new
		@champions = []
	end

	def champions
		@champ_data = get_data({"champData" => "recommended,lore"})
		build_champs
		@champions
	end

	def items
		@loader.set_path('br', 'item')
		@items = get_data
	end

	private

	def get_data(params = {})
		resp = @loader.make_request(params)
		data_hsh = JSON.parse(resp.body)
		data_hsh['data']
	end

	def build_champs

		@champ_data.each_pair do |k, v|
			c = Champion.new(v["id"], v["title"], v["name"], v["key"], v["lore"], v["recommended"])
			@champions << c
		end

		@champions.sort! { |a, b| a.name.downcase <=> b.name.downcase }
	end

end
