require "player"

describe Player do
	let(:player) { Player.new("Jonathan", "☢") }

	it "has a name" do
		expect(player.name).to eq("Jonathan")
	end
end