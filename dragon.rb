class Dragon
  
  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  #  He's full.
    @stuffInIntestine =  0  #  He doesn't need to go.
    
    puts @name + ' is born.'
  end
  
  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end
  
  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end
  
  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end
  
  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end
  
  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off blinking his large dragon eyes...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end
  def pee
    puts 'You try to let him outside but he pees on you instead, a sign of affection among dragons (you think)'
    @stuffInIntestine = 0
  end
  
  private
  
  #  "private" means that the methods defined here are
  #  methods internal to the object.  (You can feed
  #  your dragon, but you can't ask him if he's hungry.)
  
  def hungry?
    #  Method names can end with "?".
    #  Usually, we only do this if the method
    #  returns true or false, like this:
    @stuffInBelly <= 2
  end
  
  def poopy?
    @stuffInIntestine >= 8
  end
  
  def passageOfTime
    if @stuffInBelly > 0
      #  Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  #  Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  #  This quits the program.
    end
    
    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had a poopy accident...'
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end
  
end

dragonsBorn = []

1.times do
  puts 'You find an adorable baby dragon.  What would you like to name him? '
  dragname = gets.chomp
  @pet = Dragon.new dragname
  dragonsBorn << @pet
end

puts ""
print dragonsBorn
puts ""
puts ""

while @stuffInBelly != 0
  puts 'You can feed, walk, sleep, pee, toss or rock your baby dragon.  What to do next?'
  action = gets.chomp.downcase
  if action == 'feed'
      @pet.feed
    elsif action == 'walk'
      @pet.walk
    elsif action == 'sleep'
      @pet.putToBed
    elsif action == 'toss'
      @pet.toss
      puts ""
      print dragonsBorn
      puts ""
      puts ""
    elsif action == 'rock'
      @pet.rock
    elsif action == 'bathroom'
      @pet.pee
    else
      puts dragname + ' looks at you sideways not seeming to understand.  Please enter one of the following options: Feed, Walk, Sleep, Toss, or Rock'
  end
end
