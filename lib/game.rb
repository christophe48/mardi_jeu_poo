class Game
  attr_accessor :human_player, :enemies

  def initialize
    @human_player = HumanPlayer.new(name)
    @enemies = []
    @enemies << enemies_create
  end
end
