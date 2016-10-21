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
    traverse_list(@recommended.clone)
	end

  def recommended_list(index)
    return @recommended_items[index] if check_recommended_size(index)
    raise "Index out of range. Expetecd a value between 0 and #{recommended_size - 1}"
  end

  def recommended_size
    @recommended_items.size
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

    key = head["type"].to_s
    key.gsub!(/_/, ' ')
    key.gsub!(/jungle/, ' jungle')
    key.capitalize!
    hsh[key] = head["items"].map { |item| item.fetch("id") }

    traverse_blocks(tail, hsh)
  end

  def check_recommended_size(index)
    index < @recommended_items.size
  end

end # class
