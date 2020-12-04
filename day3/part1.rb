class Day3
	attr_reader :input

	def initialize(input)
		@input = input
	end

	def caluclateObstacles(start_position, slopes, down = 1)
		@input.drop(down).each_with_index.count do |line, idx|
			unless down != 1
				tree = line[start_position % line.length] == '#'
				start_position += slopes
				tree		
			else 
				if idx.even?
					tree = line[start_position % line.length] == '#'
					start_position += slopes
					tree
				end
			end 
		end
	end

end




