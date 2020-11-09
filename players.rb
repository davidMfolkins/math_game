class Players
  attr_accessor :hearts
  attr_reader :player_name

def initialize (player_name)
  @player_name = player_name
  @hearts = 3
end 

def greeting
  return "Hello, #{@player_name}, let's play!"
end 

def lose_hearts
  @hearts -= 1
end 
end