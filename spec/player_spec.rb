require "player"

describe Player do
	let(:player) { Player.new("Jonathan") }

	it "has a name" do
		expect(player.name).to eq("Jonathan")
	end

	describe "#take_turn" do
		it "takes string input and converts it to a number" do
			input = StringIO.new("3")

			expect(player.take_turn(input)).to eq(3)
		end
	end
end