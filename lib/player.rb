class Player
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def take_turn(stdin = $stdin)
		puts "Which column would you like to drop your disc in?"
		input = stdin.gets.chomp.to_i

		until (1..7).include?(input)
			puts "That is an incorrect value! Try again:\n> "
			input = stdin.gets.chomp
		end
		input
	end
end