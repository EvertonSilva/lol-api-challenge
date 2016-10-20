
class RecommendedList
  attr_reader :block

  GAME_MAPS = {
    "CS" => "Crystal Scar",
    "HA" => "Howling Abyss",
    "SR" => "Summoner's Rift",
    "TT" => "Twisted Treeline"
  }

  def initialize(game_map, block)
    @game_map = game_map
    @block = block
  end

  def game_map
    GAME_MAPS[@game_map.to_s]
  end
end