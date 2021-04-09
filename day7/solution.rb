#!/usr/env/bin ruby

require_relative 'day7'

input = ARGF.read

d = Day7.new(input)

d.parse()