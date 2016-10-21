
class RecommendedList
  attr_reader :group_items

  GAME_MAPS = {
    "CS" => "Crystal Scar",
    "HA" => "Howling Abyss",
    "SR" => "Summoner's Rift",
    "TT" => "Twisted Treeline"
  }

  def initialize(game_map, group_items)
    @game_map = game_map
    @group_items = group_items
  end

  def game_map
    GAME_MAPS[@game_map.to_s]
  end
end