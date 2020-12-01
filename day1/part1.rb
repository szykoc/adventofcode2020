class Solutnion 

    def self.load() 
        nums = File.read("input.txt").split.map {|e| e.to_i}

        nums.each_with_index {|val, idx|
            nums.each_with_index {|val_inner, idx_inner = 1|
                nums.each_with_index {|val_inner_deep, index_inner_deep = 2|
                    res = val + val_inner + val_inner_deep
                    if res == 2020
                        puts "#{res} - from values: #{val} - idx #{idx} + #{val_inner} - #{idx_inner} + #{val_inner_deep} - #{index_inner_deep}" 
                        puts "Result : #{val * val_inner * val_inner_deep}"
                        return
                    end
                }
            }
        }

    end

end


Solutnion.load