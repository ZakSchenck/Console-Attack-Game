require "colorize"

class Player
  # Player Variables
  attr_accessor :player_name, :attackOne, :attackTwo, :attackThree, :attackFour, :health

  # Player initializer
  def initialize(player_name, attackOne, attackTwo, attackThree, attackFour, health)
    @player_name = player_name
    @attackOne = attackOne
    @attackTwo = attackTwo
    @attackThree = attackThree
    @attackFour = attackFour
    @health = health
  end
end

class Attack
  # Attack Variables
  attr_accessor :attackName, :damage, :missMod

  # Attack initializer
  def initialize(attackName, damage, missMod)
    @attackName = attackName
    @damage = damage
    @missMod = missMod
  end

  def player_attack(player, opponent)
    randomAttackArray = Array[TentaTickle, Tentawhirl, Constrict, SkullSmash]
    randomAttack = randomAttackArray[rand(0..3)]
    
    newHealth = opponent.health -= damage
    puts "#{player.player_name} used #{attackName}! It did #{damage} damage. #{opponent.player_name} has #{newHealth} HP left".red

    newPlayerHealth = player.health -= randomAttack.damage
    puts "#{opponent.player_name} used #{randomAttack.attackName}! It dealt #{randomAttack.damage} damage. You have #{newPlayerHealth} left".red
  end
end

  # Initializing player one attacks
  Slice = Attack.new("Slice", 12, 20)
  BodySlam = Attack.new("Body Slam", 17, 10)
  Thundershock = Attack.new("Thundershock", 22, 8)
  Agility = Attack.new("Agility", 25, 5)
  # Player one character initialization
  MewTwo = Player.new("MewTwo", Slice, BodySlam, Thundershock, Agility, 100)

  # Initializing OPPONENT attacks
  TentaTickle = Attack.new("TentaTickle", 8, 20)
  Tentawhirl = Attack.new("Tentawhirl", 12, 10)
  Constrict = Attack.new("Constrict", 16, 8)
  SkullSmash = Attack.new("SkullSmash", 17, 5)

  # Opponent character initialization
  Deoxys = Player.new("Deoxys", TentaTickle, Tentawhirl, Constrict, SkullSmash, 150)
  while (MewTwo.health && Deoxys.health > 0)
    attackInput = ""
    while (attackInput != "1" && attackInput != "2" && attackInput != "3" && attackInput != "4")
      puts "================================================================="
      puts "Choose your move!"
      puts "Press 1: #{MewTwo.attackOne.attackName}
      Press 2: #{MewTwo.attackTwo.attackName}
      Press 3: #{MewTwo.attackThree.attackName}
      Press 4: #{MewTwo.attackFour.attackName}"
      attackInput = gets.chomp
    end
    # Deciding which attack to use
    case attackInput
    when "1"
      Slice.player_attack(MewTwo, Deoxys)
    when "2"
      BodySlam.player_attack(MewTwo, Deoxys)
    when "3"
      Thundershock.player_attack(MewTwo, Deoxys)
    when "4"
      Agility.player_attack(MewTwo, Deoxys)
    end
  end

  if (MewTwo.health <= 0)
    puts "You LOSE! Deoxys wins!".red
  else
    puts "You WIN!".green
  end
