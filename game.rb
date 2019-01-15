# Math Game Ruby Exercise - Game.rb

class Player
  attr_accessor  :name, :life

  def initialize(name)
    @name = name
    @life = 3
  end

  def enter_names
      puts "Please enter your name: "
      @name = gets.chomp
  end
end

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

player1.enter_names
player2.enter_names

class Game

    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @turn = 1
      @current_player = ""
      @number1 = 0
      @number2 = 0
      @user_answer = nil
    end

    def turn_select
      @current_player = @player1 if @turn.odd?
      @current_player = @player2 if @turn.even?
    end

    def ask_question
      @number1 = rand(1..20).to_i
      @number2 = rand(1..20).to_i
      puts "Hey, #{@current_player.name}! What is #{@number1} + #{@number2}?"
      @user_answer = gets.chomp.to_i
    end

    def check_answer
      answer = @number1 + @number2
      if answer == @user_answer
        puts "Congratulations! That is correct!"
      else 
        @current_player.life = @current_player.life - 1 
        puts "Nah bro. Better luck next time!"
      end
      @turn += 1
    end

    def print_score
      puts "The score is: #{@player1.name}: #{@player1.life} and #{@player2.name}: #{@player2.life}"
    end

    def end_game
      puts "--- END OF GAME! --- #{@current_player.name} lost!"
    end

    def game_loop
      while @player1.life > 0 && @player2.life > 0 do
        turn_select
        ask_question
        check_answer
        print_score
        puts "--- NEW TURN ---"
      end
      end_game

    end
end


new_game = Game.new(player1, player2)
new_game.game_loop