system "clear"

class Stuff
  attr_accessor :name1
  attr_accessor :name2
  attr_accessor :health_points
  attr_accessor :health_points2
  attr_accessor :recovery_rate1
  attr_accessor :recovery_rate2
  attr_accessor :times
  def initialize(name1, name2, health_points, health_points2, recovery_rate1,
    recovery_rate2, times)
    @name1 = name1
    @name2 = name2
    @health_points = health_points
    @health_points2 = health_points2
    @recovery_rate1 = recovery_rate1
    @recovery_rate2 = recovery_rate2
    @times = times
  end

  #Puts out player values
  def to_s
    puts "Name 1: #{@name1}"
    puts "Name 2: #{@name2}"
    puts "Health 1: #{@health_points}"
    puts "Health 2: #{@health_points2}"
    puts "Recovery 1: #{@recovery_rate1}"
    puts "Recovery 2: #{@recovery_rate2}"
  end

  #Running the simulation
  def battle
    #Converting the instance variale back to a variable to change its values
    @battle_health_points = @health_points
    @battle_health_points2 = @health_points2
    #Dealing damage proportionate to MAX HP
    damage = @health_points/3
    damage2 = @health_points2/3
    #Determines who moves first randomly
    coin_flip = rand(1..100)
    while @battle_health_points > 0 && @battle_health_points2 > 0
      if coin_flip <= 50
        #Name 1 actions during their turn
        if @battle_health_points > 0 && @battle_health_points2 > 0
          if @battle_health_points < @health_points - @recovery_rate1 &&
            @battle_health_points > 0
            @battle_health_points = @recovery_rate1 + @battle_health_points
            puts "#{@name1} recovered #{@recovery_rate1} HP!"
            random1 = rand(damage..(2 * damage))
            @battle_health_points2 = @battle_health_points2 - random1
            puts "#{@name2} took #{random1} damage!"
          else
            random1 = rand(damage..(2 * damage))
            @battle_health_points2 = @battle_health_points2 - random1
            puts "#{@name2} took #{random1} damage!"
          end
        end
        #Name 2 actions during their turn
        if @battle_health_points > 0 && @battle_health_points2 > 0
          if @battle_health_points2 < @health_points2 - @recovery_rate2 &&
            @battle_health_points2 > 0
            @battle_health_points2 = @recovery_rate2 + @battle_health_points2
            puts "#{@name2} recovered #{@recovery_rate2} HP!"
            random2 = rand(damage2..(2 * damage2))
            @battle_health_points = @battle_health_points - random2
            puts "#{@name1} took #{random2} damage!"
          else
            random2 = rand(damage2..(2 * damage2))
            @battle_health_points = @battle_health_points - random2
            puts "#{@name1} took #{random2} damage!"
          end
        end

        #Puts out current helath point status
        puts "#{@name1} HP: #{@battle_health_points}"
        puts "#{@name2} HP: #{@battle_health_points2}"

        #Death Message
        if @battle_health_points <= 0
          puts "#{@name1} HAS BEEN DEFEATED"
          @name2_win_counter += 1
        end

        if @battle_health_points2 <= 0
          puts "#{@name2} HAS BEEN DEFEATED"
          @name1_win_counter += 1
        end
      else
        #Name 2 actions during their turn
        if @battle_health_points > 0 && @battle_health_points2 > 0
          if @battle_health_points2 < @health_points2 - @recovery_rate2 &&
            @battle_health_points2 > 0
              @battle_health_points2 = @recovery_rate2 + @battle_health_points2
              puts "#{@name2} recovered #{@recovery_rate2} HP!"
              random2 = rand(damage2..(2 * damage2))
              @battle_health_points = @battle_health_points - random2
              puts "#{@name1} took #{random2} damage!"
            else
              random2 = rand(damage2..(2 * damage2))
              @battle_health_points = @battle_health_points - random2
              puts "#{@name1} took #{random2} damage!"
            end
          end

        #Name 1 actions during their turn
        if @battle_health_points > 0 && @battle_health_points2 > 0
          if @battle_health_points < @health_points - @recovery_rate1 &&
            @battle_health_points > 0
            @battle_health_points = @recovery_rate1 + @battle_health_points
            puts "#{@name1} recovered #{@recovery_rate1} HP!"
            random1 = rand(damage..(2 * damage))
            @battle_health_points2 = @battle_health_points2 - random1
            puts "#{@name2} took #{random1} damage!"
          else
            random1 = rand(damage..(2 * damage))
            @battle_health_points2 = @battle_health_points2 - random1
            puts "#{@name2} took #{random1} damage!"
          end
        end
        #Puts out current health point status
        puts "#{@name1} HP: #{@battle_health_points}"
        puts "#{@name2} HP: #{@battle_health_points2}"

        #Death Message
        if @battle_health_points2 <= 0
          puts "#{@name2} HAS BEEN DEFEATED"
          @name1_win_counter += 1
        end

        if @battle_health_points <= 0
          puts "#{@name1} HAS BEEN DEFEATED"
          @name2_win_counter += 1
        end
      end
    end
  end

  #Multiple runs
  def many_battles
    @name1_win_counter = 0
    @name2_win_counter = 0
    (@times).times do
      battle
      puts " "
    end
    puts "#{@name1} wins: #{@name1_win_counter}"
    puts "#{@name2} wins: #{@name2_win_counter}"
  end

  #Runs With User input
  def user_input
    puts "* * * *RULES* * * *"
    puts "In this game Health Points or HP is the basis for dealing damage. Each
    attack will hit as hard as 33% to 66% of your charachters MAX Health Points.
    Recovery Rate heals each turn based on how high it is. It doesn't allow you
    to play out each turn yet but for now just put in the values and have fun!"
    print "Enter Name 1: "
    n1 = gets.chomp
    print " Enter Name 2: "
    n2 = gets.chomp
    puts " "
    print "Enter #{n1}'s Health Points: "
    hp1 = gets.to_i
    print " Enter #{n2}'s Health Points: "
    hp2 = gets.to_i
    puts " "
    print "Enter #{n1}'s Recovery Rate: "
    rr1 = gets.to_i
    print " Enter #{n2}'s Recovery Rate: "
    rr2 = gets.to_i
    puts " "
    @name1 = n1
    @name2 = n2
    @health_points = hp1
    @health_points2 = hp2
    @recovery_rate1 = rr1
    @recovery_rate2 = rr2

    battle
  end

  #Implements moves into a battle
  def move_battle
    #move1_cd = 0
    #move1 = ((@battle_health_points/3) * 2)
    #move1. = @battle_health_points - @battle_health_points/3
    #move1.. = move1_cd = 3
    #crit_strike = move1 && move1. && move1_cd


  end

  #Lets you choose how you want to play
  def choice
    puts "How do you want to play?:"
    print "Many Battles "
    print "- Choose Your Stats "
    print "- Move Battle(unavailable)"
    puts " "
    print "Enter your choice: "
    choice = gets.chomp

    if choice == "Many Battles"
      system "clear"
      many_battles
    elsif choice == "many battles"
      system "clear"
      many_battles
    elsif choice == "Many battles"
      system "clear"
      many_battles
    elsif choice == "many Battles"
      system "clear"
      many_battles
    elsif choice == "Choose Your Stats"
      system "clear"
      user_input
    elsif choice == "choose your stats"
      system "clear"
      user_input
    elsif choice == "Choose your stats"
      system "clear"
      user_input
    elsif choice == "choose Your stats"
      system "clear"
      user_input
    elsif choice == "choose your Stats"
      system "clear"
      user_input
    elsif  choice == "Move Battle"
      puts "This Mode is unavailable"
    elsif choice == "move battle"
      puts "This Mode is unavailable"
    else
      puts "Type in one of the choices"
    end
  end
end

battle = Stuff.new("Timmy", "Tommy", 200, 300, 150, 50, 1000)
interactive_battle = Stuff.new("Luigi", "Waluigi", 100, 100, 10, 10, 20)

#interactive_battle.user_input
#battle.many_battles
interactive_battle.choice
