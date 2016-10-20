class Champion
	attr_reader :id, :title, :key, :name, :items_id

	def initialize(id, title, name, key, items_id)
		@id = id
		@title = title
		@name = name
		@key = key
    @items_id = items_id
	end


end
