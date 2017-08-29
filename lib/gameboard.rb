require_relative "player.rb"

class GameBoard
	attr_accessor :board, :player1, :player2, :turns

	def initialize(name1="Player 1", name2="Player 2")
		@board = Array.new(7) { Array.new(6, " ") }
		@player1 = Player.new(name1)
		@player2 = Player.new(name2)
		@turns = 1
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

		display_string << "+---+---+---+---+---+---+---+\n"
		display_string << "  1   2   3   4   5   6   7"

		puts display_string
	end

	def instructions
		puts "\nWelcome to Connect Four!
				\nThis is a two player game where you will take turns dropping 'discs' from the top of the board.
				\nWhoever gets four in a row, whether horizontally, vertically, or diagonally, wins!"
	end
end

=begin
turns: starts a loop that changes @player_turn value every turn and checks for win scenario

turn: has @player1/@player2 take_turn and add_disc to @board

add_disc: adds a value to the 'bottom' of the column array in the appropriate @board array

check_for_win: checks for win scenarios, for every added disc, it will check all discs at distance = 1 if they are the same, if so:
							 it will check in the same direction to see if there are 4 in a row, if so, win conditions are met
win: displays winning text
=end