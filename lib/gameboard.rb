require_relative "player.rb"

class GameBoard
	attr_accessor :board, :player1, :player2, :player_turn

	def initialize(name1="Player 1", name2="Player 2")
		@board = Array.new(7) { Array.new(6, " ") }
		@player1 = Player.new(name1)
		@player2 = Player.new(name2)
		@player_turn = 1
	end

	def play
		puts title
		display
		instructions
	end

	def title
		" .--.                     .    .---.             
:                        _|_   |                 
|    .-. .--. .--. .-. .-.|    |--- .-. .  . .--.
:   (   )|  | |  |(.-'(   |    |   (   )|  | |   
 `--'`-' '  `-'  `-`--'`-'`-'  '    `-' `--`-'   "
	end

	def display
		display_string = ""

		5.downto(0) do |row|
			display_string << "+---+---+---+---+---+---+---+\n"
			0.upto(6) do |column|
				display_string << "| #{@board[column][row]} "
			end
			display_string << "|\n"
		end

		display_string << "+---+---+---+---+---+---+---+"

		puts display_string
	end
end