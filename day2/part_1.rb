input_arr = File.read("input.txt").split("\n")

valid_passowrds = input_arr.count do |line| 
    arr = line.split(":")
    delimeters = ['-', ' ']
    min, max, letter = arr[0].split(Regexp.union(delimeters))
    password = arr[1].strip
   
    letter_count = password.count(letter)
   
    letter_count >= min.to_i && letter_count <= max.to_i

end

p valid_passowrds
