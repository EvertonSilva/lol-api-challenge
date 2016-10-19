require 'json'
require_relative 'data_loader'
require_relative 'champion'

class DataHandler

	def initialize
		@loader = DataLoader.new
		@champions = []
	end

	def self.champions
		@champ_data = get_data("champsData"=>"recommended")
		build_champs
	end

	def self.items
		@loader.set_path('br', 'item')
		@items = get_data
	end

	private

	def get_data(champ_data = nil)
		params = {"locale"=>"pt_BR"}
		paramas.merge champ_data if defined? champ_data
		resp = @loader.make_request(params)
		data = JSON.parse(resp.body)
		data['data'];
	end

	def build_champs

		traversing_data = Proc.new do |data, key|
  		data.map { |hsh| hsh.fetch(key) }.flatten
		end

		@chap_data.each_pair do |k, v|

			# traverse json structure for recommended items
			# and generate an array of items id's
			blocks = traversing_data.call(v[:recommended], :blocks)
			items = traversing_data.call(blocks, :items)
			ids = traversing_data.call(items, :id)

			c = Champion.new(v[:id], v[:title], v[:name], v[:key], ids)
			@champions << c
		end
	end

end
