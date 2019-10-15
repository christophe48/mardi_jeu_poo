require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def class_humanplayer_play

  puts "   -------------------------------------------------
    |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
    |Le but du jeu est d'être le dernier survivant !|
    -------------------------------------------------\n"
  puts "Bonjour jeune survivaliste, qu'elle est ton nom ?"
  print ">"
  name_player = gets.chomp

  joueur1 = HumanPlayer.new(name_player)

  array_ennemies = [] #ce tableau me permet de lister les ID ennemies
  array_ennemies_name = [] #ce tableau me permet de  lister les noms des enemies
  ennemies1 = Player.new("Jacquie")
  ennemies2 = Player.new("Michel")
  array_ennemies << ennemies1
  array_ennemies << ennemies2
  array_ennemies_name << ennemies1.name
  array_ennemies_name << ennemies2.name

#phase de combat
  i = 1
  while joueur1.life_points > 0 && (ennemies1.life_points > 0 || ennemies2.life_points > 0)
    puts ""
    puts "----------------Tour #{i}----------------"
    joueur1.show_state
    puts "Quelle action tu veux faire ? "
    puts "Marque 'H' pour te soigner"
    puts "Marque 'W' pour chercher une autre arme"
    puts "Marque 'A' pour attaquer"
    puts "Marque 'F' pour abandonner"
    print ">"
    action = gets.chomp #je demande au joueur ce qu'il veut faire en lui expliquant les règles ci-dessus
    if action == "H" || action == "h"
      puts "Tu recherches de quoi te soigner"
      sleep(1) #cette fonction me permet de ralentir l'affichage à 1s entre les éléments (ca evite d'avoir un gros pavé d'un coup)
      joueur1.search_health_pack
    elsif action == "W" || action == "w"
      puts "Tu recherches de quoi te battre"
      sleep(1)
      joueur1.search_weapon
    elsif action == "A" || action == "a" #dans cette foction je veux qu'il choississent qui il doit taper
      puts "Qui tu veux taper ? Met le le nom de l'ennemie présent dans la liste suivant"
      puts array_ennemies_name
      print ">"
      action_attack = gets.chomp
        if action_attack == "Jacquie" || action_attack == "jacquie" || action_attack == "JACQUIE"
          if ennemies1.is_dead?
            puts "#{ennemies1.name} est déjà mort, arrète la nécrophilie. Tu as d'autre ennemie"
          else
            joueur1.attacks(ennemies1)
          end
        elsif action_attack == "Michel" || action_attack == "MICHEL" || action_attack == "michel"
          if ennemies1.is_dead?
            puts "#{ennemies2.name} est déjà mort, arrète la nécrophilie. Tu as d'autre ennemie"
          else
          joueur1.attacks(ennemies2)
          end
        else
          alea = rand(0..array_ennemies_name.size-1) #je crée ma variable aléa qui prendre des chiffre de 0 à la taille de mon tableau -1 vu que ruby compte à partir de 0
          ennemies_alea = array_ennemies[alea] #cette variable va me permettre de choisir un enemie aleatoirement dans mon tableau
          puts "Tu as du mal à t'exprimer du coup tu as tapé #{array_ennemies_name[alea]} qui était à ta porté"
          joueur1.attacks(ennemies_alea)
          if array_ennemies[alea].is_dead?
            puts "#{array_ennemies_name[alea]} est déjà mort, arrète la nécrophilie. Tu as d'autre ennemie"
          end
        end
    elsif action == "F" || action == "f"
      puts "Chuck Noris est arrivé et t'a tué avec son pouce, tu as perdu"
      joueur1.life_points = 0
      break #cette fonction me permet de stopper la boucle
    else
      puts "Ton personnage a été distrait par une mouche (la prochaine fois choisit une lettre entre H,W,A ou F)"
    end
    sleep(1)

    if ennemies1.life_points > 0
      ennemies1.attacks(joueur1)
      sleep(0.5)
    else
      puts "#{ennemies1.name} est mort"
    end

    if ennemies2.life_points > 0
      ennemies2.attacks(joueur1)
      sleep(0.5)
    else
      puts "#{ennemies1.name} est mort"
    end
    i += 1
  end

  if joueur1.life_points > 0
    puts "Félicitation #{joueur1.name}, tu as gagné ton combat"
  else
    puts "Kevin tu me dégoutes, t'as perdu, je verrais jamais des paillettes dans ma vie"
  end
end


class_humanplayer_play #pour jouer au jeux numéro 2
