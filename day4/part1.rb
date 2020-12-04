class Day4

	attr_reader :input_data

	def initialize(input)
		@input_data = input
	end


	def test
		@input_data.each do |line|
			p line
		end
	end

end
