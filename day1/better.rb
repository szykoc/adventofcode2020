input_arr = File.read("input.txt").split.map(&:to_i)

input_arr_permutations = input_arr.permutation(2).to_a

res = input_arr_permutations.find do |p|
    p.sum == 2020
end

puts res.inject(:*)