require "game"

describe "game" do

	describe "#get_name" do
		before do
			$stdin = StringIO.new("Jonathan")
		end

		it "gets player name as input" do
			expect(get_name).to eq("Jonathan")
		end
	end
end