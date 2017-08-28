require "gameboard"
require "player"

describe GameBoard do
	let(:gameboard) { GameBoard.new("Jonathan", "Cesilia") }

	it "is a class" do
		expect(gameboard).to be_instance_of GameBoard
	end

	it "has instance variables: board, player1, player2, and player_turn" do
		expect(gameboard).to respond_to(:board, :player1, :player2, :player_turn)
	end

	describe "instance variables" do
		describe "players" do
			it "has player instances" do
				expect(gameboard.player1).to be_a Player
				expect(gameboard.player2).to be_a Player
			end
		end

		describe "player turn" do
			it "starts as 1" do
				expect(gameboard.player_turn).to eq(1)
			end
		end

		describe "board" do
			it "has an array filled with subarrays representing 6 row columns" do
				test_board = Array.new(7) { Array.new(6, " ") }
				expect(gameboard.board).to eq(test_board)
			end
		end
	end

	describe "#play" do
		it "calls the title, gameboard, and instructions" do
			expect(gameboard).to receive(:title)
			expect(gameboard).to receive(:display)
			expect(gameboard).to receive(:instructions)

			gameboard.play
		end
	end

	describe "#title" do
		it "has the title" do
			expect(gameboard.title).to eq(" .--.                     .    .---.             
:                        _|_   |                 
|    .-. .--. .--. .-. .-.|    |--- .-. .  . .--.
:   (   )|  | |  |(.-'(   |    |   (   )|  | |   
 `--'`-' '  `-'  `-`--'`-'`-'  '    `-' `--`-'   ")
		end
	end

	describe "#display" do
		it "prints the game board" do
			expect(STDOUT).to receive(:puts).with("+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+")

			gameboard.display
		end

		it "handles modified game boards" do
			expect(STDOUT).to receive(:puts).with("+---+---+---+---+---+---+---+
| ☯ |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   | ☢ |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   | ☯ |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+")

			gameboard.board[0][5] = "☯"
			gameboard.board[2][2] = "☢"
			gameboard.board[6][1] = "☯"

			gameboard.display
		end		
	end


end

=begin
Board
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+

Disks
☯ = Ying Yang Disk
☢ = Radioactive Disk

class Class
	def test
		puts "testing"
	end
end

describe Class do
	it "puts from test method" do
		expect(STDOUT).to receive(:puts).with("testing")

		class.test
	end
end
=end