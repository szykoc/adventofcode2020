input_arr = File.read("input.txt").split("\n")

firstIdx = 3

trees = input_arr.drop(1).count do |line| 
    tree = line[firstIdx % line.length] == '#'
    firstIdx += 3
    tree
end

p trees


