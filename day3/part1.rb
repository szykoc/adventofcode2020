class Day3
	attr_reader :input

	def initialize(input)
		@input = input
	end


	def caluclateObstacles(start_position, sloopes)
		@input.drop(1).count do |line| 
		    tree = line[start_position % line.length] == '#'
		    start_position += sloopes
		    tree
		end
	end

end




