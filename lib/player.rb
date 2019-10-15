class Player
attr_accessor :name, :life_points, :weapon_level #je met weapon_level aussi ici pour que les calcules soient vraie au second jeux

  def initialize(name_to_update,life_points_to_update=10)
    @name = name_to_update
    @life_points = life_points_to_update
    @degat = 0 # j'initialise une variable de classe degat afin de m'en servir dans toute la classe
    @weapon_level = 1
  end

 #cette def me permet de voir les stats du personnage
  def show_state
    puts "#{name} à #{life_points} points de vie"
  end
# cette def permet de retirer des dommages aux life_points d'un joueur
  def gets_damage(damages)
      @life_points -= damages
    if life_points > 0
      puts "#{name} a perdu #{damages}, il lui reste #{life_points} points de vie"
    else
      puts "#{name} a perdu #{damages}, #{name} a été tué"
    end
  end
# cette def me permet de faire attaquer un joueur un autre joueur
  def attacks(victime_name)
    @degat = compute_damage
    puts "le joueur #{name} fait #{coup} sur le joueur #{victime_name.name}!"
    victime_name.gets_damage(@degat)
  end
#cette def me permet d'infliger des dégats aléatoires
  def compute_damage
      return rand(1..6) * @weapon_level
  end

  def coup #cette methode me permet de nommer les coups portés
    if @degat == 1
      return "une Pichnette"
    elsif @degat == 2
      return "une giffle"
    elsif @degat == 3
      return "un Coup de pied"
    elsif @degat == 4
      return "un Coup de tibia"
    elsif @degat == 5
      return "une PATATE DE FORRAIN"
    else
      return "un UPERCUT"
    end
  end

  def is_dead? #cette def me permet de savoir si le joueur est mort
    #ce qui mepermettra de faire des phrase de fin dans mon app
    return @life_points <= 0
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name_to_update)
    @name = name_to_update
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  #avec ma def "coup" dans Player il y a deux random qui sont généré
  #je décide d'enlevé celle ci d'ici pour la mettre dans player
  #afin que les calculs sont bon en fonction du coup porté

  #def compute_damage
  #  rand(1..6) * @weapon_level
  #end

#cette def me permet de faire une action de recherche d'une nouvelle arme
  def search_weapon
    new_level_weapon = rand(1..6)
    puts "#{@name} a trouvé une arme de niveau #{new_level_weapon}"
    if @weapon_level < new_level_weapon
      @weapon_level = new_level_weapon
      puts "#{@name} équipe cette fabuleuse arme"
    else
      puts "#{@name} jette cette arme toute pérave"
    end
  end
# cette def me pemet de faire une action de recherche de soins
  def search_health_pack
    health_pack= rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack >= 2 && health_pack <=5
      puts  "Bravo, tu as trouvé un pack de +50 points de vie !"
      health_pack = 50
      if @life_points < 100 #je met une conditon pour pas dépasser 100 point de vie
        @life_points = @life_points + health_pack
        if @life_points > 100
          @life_points = 100
        end
      end
      puts "Votre Santé en est rendu à #{@life_points} point de vie"
    else health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      health_pack = 80
      if @life_points < 100
        @life_points = @life_points + health_pack
        if @life_points > 100
          @life_points = 100
        end
      end
      puts "Votre Santé en est rendu à #{@life_points} point de vie"
    end
  end
end
