require 'json'
require_relative 'data_loader'
require_relative 'champion'

class DataHandler

	def initialize
		@loader = DataLoader.new
		@champions = []
	end

	def champions
		@champ_data = get_data({"champData" => "recommended"})
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

		traversing_data = Proc.new do |data, key|
  		data.map { |hsh| hsh.fetch(key) }.flatten
		end

		@champ_data.each_pair do |k, v|

			# traverse json structure for recommended items
			# and generate an array of items id's
			blocks = traversing_data.call(v["recommended"], "blocks")
			items = traversing_data.call(blocks, "items")
			ids = traversing_data.call(items, "id")

			c = Champion.new(v["id"], v["title"], v["name"], v["key"], ids.uniq)
			@champions << c
		end
	end

end
