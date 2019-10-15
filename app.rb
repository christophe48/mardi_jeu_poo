require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_exo1'

def class_player_play
  joueur1 = Player.new("Jacquie", 10)
  puts "A ma droite, la Catwomen des temps modernes, j'ai l'honneur de vous présenter #{joueur1.name}!"
  puts joueur1.show_state
  joueur2 = Player.new("Michel", 10)
  puts "A ma gauche, le champion en titre #{joueur2.name} ! Va-t'il perdre sa ceinture?"
  puts joueur2.show_state
  puts "Honneur à #{joueur1.name}"
  puts "Débutons le combat\n"

i=1
  while joueur1.is_dead? == false && joueur2.is_dead? == false
   puts"----------------Round #{i}----------------"
    if joueur1.life_points > 0
       joueur1.attacks(joueur2)
       puts ""
    end

    if joueur2.life_points > 0
      joueur2.attacks(joueur1)
      puts ""
    end

    i += 1
    sleep(0.1)
  end
  if joueur1.is_dead?
    puts "WOW! #{joueur2.coup} de #{joueur2.name}, malheuresement sur ce coup, je pense que #{joueur1.name} ne se relèvera pas"
    puts "Nous avons notre vainqueur, #{joueur2.name} conservera sa ceinture"
  else
    puts "OUTCH!, #{joueur1.coup} SERA FATAL POUR NOTRE VAINQUEUR EN TITRE #{joueur2.name}"
    puts "C'est incroyable #{joueur1.name} a détronné notre champion #{joueur2.name}!!"
  end
end

class_player_play #pour jouer au jeux numéro 1
