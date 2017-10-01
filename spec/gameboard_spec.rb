require "gameboard"
require "player"

describe GameBoard do
  let(:gameboard) { GameBoard.new("Jonathan", "Cesilia") }

  it "is a class" do
    expect(gameboard).to be_instance_of GameBoard
  end

  it "has instance variables: board, player1, player2, options, and turn_number" do
    expect(gameboard).to respond_to(:board, :player1, :player2, :turn_number, :options)
  end

  describe "instance variables" do
    describe "players" do
      it "has player instances" do
        expect(gameboard.player1).to be_a Player
        expect(gameboard.player2).to be_a Player
      end
    end

    describe "turn_number" do
      it "starts as 1" do
        expect(gameboard.turn_number).to eq(1)
      end
    end

    describe "board" do
      it "has an array filled with subarrays representing 6 row columns" do
        test_board = Array.new(7) { Array.new(6, " ") }
        expect(gameboard.board).to eq(test_board)
      end
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
      expect(STDOUT).to receive(:puts).with("\n+---+---+---+---+---+---+---+
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
  1   2   3   4   5   6   7")

      gameboard.display
    end

    it "handles modified game boards" do
      expect(STDOUT).to receive(:puts).with("\n+---+---+---+---+---+---+---+
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
+---+---+---+---+---+---+---+
  1   2   3   4   5   6   7")

      gameboard.board[0][5] = "☯"
      gameboard.board[2][2] = "☢"
      gameboard.board[6][1] = "☯"

      gameboard.display
    end   
  end

  describe "#check_for_win" do
    describe "#check_horizontal_wins" do
      it "acknowledges horizontal wins" do
        gameboard.board[3][5] = "☯"
        gameboard.board[4][5] = "☯"
        gameboard.board[5][5] = "☯"
        gameboard.board[6][5] = "☯"

        expect(gameboard.check_horizontal_wins).to be true
      end
    end

    describe "#check_vertical_wins" do
      it "acknowledges vertical wins" do
        gameboard.board[4][2] = "☯"
        gameboard.board[4][3] = "☯"
        gameboard.board[4][4] = "☯"
        gameboard.board[4][5] = "☯"

        expect(gameboard.check_vertical_wins).to be true
      end
    end

    describe "#check_diagonal_wins" do
      it "acknowleges diagonal wins" do
        gameboard.board[3][3] = "☯"
        gameboard.board[4][2] = "☯"
        gameboard.board[5][1] = "☯"
        gameboard.board[6][0] = "☯"

        expect(gameboard.check_diagonal_wins).to be true
      end
    end
  end
end