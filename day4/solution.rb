#!/usr/bin/env ruby

require_relative 'part1'

input = ARGF.lines.map(&:strip)

day4 = Day4.new(input)

valid_passorts = day4.validate_passports

p valid_passorts.length

day4.validate_passport_data