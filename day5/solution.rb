#!/usr/bin/env ruby

require_relative 'day5'

input = ARGF.read 

d = Day5.new(input)

d.find_seat()