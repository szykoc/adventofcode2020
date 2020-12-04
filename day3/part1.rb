class Day3
	attr_reader :input

	def initialize(input)
		@input = input
	end

	def caluclateObstacles(start_position, slopes)
		@input.drop(1).count do |line| 
			tree = line[start_position % line.length] == '#'
			start_position += slopes
			tree
		end
	end

end




