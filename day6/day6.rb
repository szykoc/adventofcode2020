class Day6

	attr_reader :input, :input_tally

	YES_ANSWSERS = [*('a'..'z')]

	def initialize(input)
		@input = input.split(/\n/)
								.slice_when {|i, j| i.empty? || j.empty?}
								.reject {|arr| arr == [""]}
								#.map {|e| e.join}
								#.map {|e| e.chars.uniq}
		@input_tally = input						

	end

	def count_yes_tally() 
			p input_tally.split("\n")
				.slice_when {|i, j| i.empty? || j.empty?}
				.reject {|arr| arr == [""]}
				.map { |arr| arr.map(&:chars).flatten.tally }
	end

	def count_yes_answers() 
		sum = 0 
		@input.each {|e|
			sum += e.length
		}
		p sum
	end

	def count_everyone_yes_answers() 
		yes = 0
		@input.each {|group|
			questions =  group.length
			group[0].chars {|person_ans|
				if questions == 1
					yes += person_ans.length
				elsif questions == group.flat_map{|e| e.chars}.count(person_ans)
					yes += 1					 	
				end
			} 
		}
		yes
	end

end