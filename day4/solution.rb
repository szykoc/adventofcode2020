#!/usr/bin/env ruby

require_relative 'part1'

input = ARGF.lines.map(&:strip).split

day4 = Day4.new(input)

day4.test