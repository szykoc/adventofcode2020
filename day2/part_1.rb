input_arr = File.read("input.txt").split("\n")

MIN_OCCUR_IDX = 0
MAX_OCCUR_IDX = 1
TEST_CHAR_IDX = 2

valid_passwords = 0

input_arr.map{|line| 
    arr = line.split(":")
    delimeters = ['-', ' ']
    policy = arr[0].split(Regexp.union(delimeters))
    password = arr[1].strip
   
    occ = 0
    password.each_char {|c| 
        if c == policy[TEST_CHAR_IDX]
            occ += 1
        end
    }
   
    if policy[MIN_OCCUR_IDX].to_i <= occ && policy[MAX_OCCUR_IDX].to_i >= occ
       valid_passwords += 1
       p "valid accoding to password policy: #{policy[0]} - #{policy[1]} - #{policy[2]} - password : #{password}"
    else
        p "not valid accoding to password policy: #{policy[0]} - #{policy[1]} - #{policy[2]} - password : #{password}"  
    end
    
}

p valid_passwords
