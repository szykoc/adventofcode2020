class Day5

	attr_reader :input_data, :intial_size, :seats_arr

	def initialize(input_data)
		@input_data = input_data.split("\n")
		@seats_arr = (0..127).to_a
		@intial_size = @seats_arr.length
	end

	# FBFBBFFRLR

  # => Start by considering the whole range, rows 0 through 127.
  # => F means to take the lower half, keeping rows 0 through 63.
  # => B means to take the upper half, keeping rows 32 through 63.
  # => F means to take the lower half, keeping rows 32 through 47.
  # => B means to take the upper half, keeping rows 40 through 47.
  # => B keeps rows 44 through 47.
  # => F keeps rows 44 through 45.
  # => The final F keeps the lower of the two, row 44.

	def show_data() 
		@input_data.each {|l| p l}
	end

	def findSeat()
		@input_data.each {|boading_pass| 
			boading_pass
				.chars
				.each {|c|
					case c
						when 'F'
							arr = first_half(@seats_arr, @intial_size)
						when 'B'
							arr = second_half(@seats_arr, @intial_size)
					end
					@intial_size = arr.length
					@seats_arr = arr
					p intial_size
					p arr 					 	 					 
				}
		}
	end


	private 

	def first_half(arr, size) 
		arr[0...size / 2]
	end

	def second_half(arr, size) 
		arr[size / 2..-1]
	end



end