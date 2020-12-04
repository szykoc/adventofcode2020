#!/usr/bin/env ruby

require_relative 'part1'

input = File.read("input.txt").split("\n")

d = Day3.new(input)

# part1
# p d.caluclateObstacles(3, 3)

res = 1

['1;1','3;1','5;1','7;1','1;2'].each do |e|
	right, down = e.split(";")
	trees = d.caluclateObstacles(right.to_i, right.to_i, down.to_i)
	res *= trees
end

p res
