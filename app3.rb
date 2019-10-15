require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def class_game_play

  puts "   -------------------------------------------------
    |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
    |Le but du jeu est d'être le dernier survivant !|
    -------------------------------------------------\n"
  puts "Bonjour jeune survivaliste, qu'elle est ton nom ?"
  print ">"
  name_player = gets.chomp

  joueur1 = HumanPlayer.new(name_player)
# j'automatise la création de mes adversaires
  4.times do |i|
    enemies_create = Player.new("Méchants#{i}")
    puts "L'enemie #{enemies_create.name} est généré"
  end
end

class_game_play #pour jouer au jeux numéro 3
