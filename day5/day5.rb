class Day5

	attr_reader :input_data

	def initialize(input_data)
		@input_data = input_data.split("\n")
	end

	def find_seat()
		row, column = Array.new

		res = Array.new(0)

		@input_data.each {|boading_pass| 

			seats_row_arr = (0..127).to_a
			seats_column_arr = (0..7).to_a

			boading_pass
				.chars
				.each {|c|
					len = seats_row_arr.length
					len_c = seats_column_arr.length
					case c
						when 'F'
							seats_row_arr = first_half(seats_row_arr, len)
						when 'B'
							seats_row_arr = second_half(seats_row_arr, len)
						when 'L'
							seats_column_arr = first_half(seats_column_arr, len_c)
						when 'R'
							seats_column_arr = second_half(seats_column_arr, len_c)
					end
				}
		
			res << seats_row_arr.first * 8 + seats_column_arr.first
			
		}

		min, max = res.minmax
		p (min..max).sum - res.inject(:+)
		p res.max {|a, b| a <=> b}
		
	end


	private 

	def first_half(arr, size) 
		arr[0...size / 2]
	end

	def second_half(arr, size) 
		arr[size / 2..-1]
	end



end