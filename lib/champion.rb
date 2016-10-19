class Champion
	attr_reader :id, :title, :key, :name

	def initialize(id, title, name, key, items_ids)
		@id = id
		@title = title
		@name = name
		@key = key
    @items_ids = items_ids
	end


end
