class Champion
	attr_reader :id, :title, :key, :name

	def initialize(champ_default = {})
		@id ||= champ_default['id']
		@title ||= champ_default['title']
		@name ||= champ_default['name']
		@key ||= champ_default['key']
	end

	
end
