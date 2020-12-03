input_arr = File.read("input.txt").split("\n")

MIN_OCCUR_IDX = 0
MAX_OCCUR_IDX = 1
TEST_CHAR_IDX = 2

password_policy = Hash.new

valid_passwords = 0

input_arr.map{|line| 
    arr = line.split(":")
   # puts arr
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
    #password_policy[arr[0].split(Regexp.union(delimeters))] = arr[1].strip
    
}

p valid_passwords

# puts password_policy

# valid_passwords = 0

# password_policy.map { |password| 
#     occ = 0
#     password[1].each_char {|c| 
#         if c == password[1][TEST_CHAR_IDX]
#             occ += 1
#         end
#     }
   
#     if password[0][MIN_OCCUR_IDX].to_i <= occ && password[0][MAX_OCCUR_IDX].to_i >= occ
#        valid_passwords += 1
#        p "valid accoding to password policy: #{password[0]} - #{password[1]}"
#     end
# }

# p valid_passwords

# puts arr
# puts password_policy