require './questions.rb'
require './players.rb'


puts "Player 1, what is your name?"
@name = gets.chomp.to_s
player1 = Players.new(@name)
puts player1.greeting
puts "---------------------"

puts "Player 2, what is your name?"
@name2 = gets.chomp.to_s
player2 = Players.new(@name2)
puts player2.greeting
puts "---------------------"

def play(player_number)
  new_question = Question.new
  puts new_question.to_string
  @answer = gets.chomp.to_i

  if new_question.check_answer(@answer)
    puts "Correct!"
    puts "---------------------"
  else
    puts "Wrong!"
    player_number.lose_hearts
    puts "#{player_number.player_name} has #{player_number.hearts} hearts left!"
    puts "---------------------"
  end
end

@turn = 1

def play_game(player_one, player_two)
  until player_one.hearts == 0 || player_two.hearts == 0
    @turn += 1
    if @turn.even?
      puts "current score #{player_one.player_name} #{player_one.hearts}/3 and #{player_two.player_name} #{player_two.hearts}/3"
      puts "#{player_one.player_name}, it's your turn!"
      puts "----- NEW QUESTION -----"
      play(player_one)
    else
      puts "current score #{player_one.player_name} #{player_one.hearts}/3 and #{player_two.player_name} #{player_two.hearts}/3"
      puts "#{player_two.player_name} it's your turn!"
      play(player_two)
    end
  end
end

puts play_game(player1, player2)

if player1.hearts == 0 
	puts "#{player2.player_name}, you win! You have #{player2.hearts} heart(s) left"
else 
	puts "#{player1.player_name}, you win! You have #{player1.hearts} heart(s) left"
end 

player1.hearts = 3
player2.hearts = 3