#!/usr/bin/env ruby

require_relative 'part1'

input = File.read("input.txt").split("\n")

d = Day3.new(input)

p d.caluclateObstacles(3, 3)
