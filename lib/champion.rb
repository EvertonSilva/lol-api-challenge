require_relative 'recommended_list'

class Champion
	attr_reader :id, :title, :key, :name, :lore

	def initialize(id, title, name, key, lore, recommended)
		@id = id
		@title = title
		@name = name
		@key = key
    @lore = lore
    @recommended = recommended
    @recommended_items = []
	end

  def recommended_items
    traverse_list(@recommended.clone)
    @recommended_items
  end

  private

  def traverse_list(list)
    return if list.empty?

    head = list.shift
    tail = list

    recommended_list = RecommendedList.new(head["map"], traverse_blocks(head["blocks"]))
    @recommended_items << recommended_list

    traverse_list(tail)
  end

  def traverse_blocks(list_blk, hsh = {})
    return hsh if list_blk.empty?

    head = list_blk.shift
    tail = list_blk

    key = head["type"]
    hsh[key] = head["items"].map { |item| item.fetch("id") }

    traverse_blocks(tail, hsh)
  end
end # class
