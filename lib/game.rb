class Game
  attr_accessor :human_player :enemies

  def initialize
    @human_player = HumanPlayer.new("")
    @enemies = []
    enemies_create = Player.new("")
    @enemies << enemies_create 
  end

end
