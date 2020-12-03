input_arr = File.read("input.txt").split("\n")

valid_passwords = input_arr.count do |e|  

	rule, password = e.split(":")
	delimeters = ['-', ' ']
	policy = rule.split(Regexp.union(delimeters))
	
	first_letter_idx = policy[0].to_i
	second_letter_idx = policy[1].to_i
	test_letter = policy[2]

	(password.strip[first_letter_idx - 1] == test_letter) ^ (password.strip[second_letter_idx - 1] == test_letter)

end

p valid_passwords

