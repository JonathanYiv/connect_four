require "game"
require "gameboard"
require "player"

describe "game.rb" do

	describe "#get_name" do
		before do
			#$stdout.stub(:write)
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
			expect(Player).to receive(:new).with("name1")
			expect(Player).to receive(:new).with("name2")
			create_game("name1", "name2")
		end
	end

	describe "#play_game" do
		before do
			allow($stdout).to receive(:write)
		end

		it "creates a new game and plays it" do
			test1 = StringIO.new("test1")
			test2 = StringIO.new("test2")

			expect(GameBoard).to receive(:new).and_return(GameBoard.new("test1", "test2"))

			play_game(test1, test2)
		end
	end
end

=begin
NOTE: This totally works. It is not proper testing best practices though.

def method_a
	method_b
end

def method_b
end

RSpec.describe "method_a" do
	it "calls method_b" do
		expect(self).to receive(:method_b)
		method_a
	end
end
	
=end