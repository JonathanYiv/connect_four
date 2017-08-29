require "game"
require "gameboard"
require "player"

describe "game.rb" do

	describe "#get_name" do
		before do
			allow($stdout).to receive(:write)
		end

		it "takes a name as input" do
			
			test = StringIO.new("test")
			name = get_name(0, test)
			expect(name).to eq("test")
		end
	end

	describe "#create_game" do
		it "creates an instance of GameBoard" do
			expect(GameBoard).to receive(:new).with("name1", "name2")
			create_game("name1", "name2")
		end

		it "takes two parameters and uses them as player names" do
			expect(create_game("name1", "name2").player1.name).to eq("name1")
			expect(create_game("name1", "name2").player2.name).to eq("name2")
		end

		it "creates new players" do
			expect(Player).to receive(:new).with("name1", "☯")
			expect(Player).to receive(:new).with("name2", "☢")
			create_game("name1", "name2")
		end
	end
end