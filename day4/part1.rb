require 'set'

class Day4
	
	attr_reader :input_data

	#byr (Birth Year) - four digits; at least 1920 and at most 2002.
	#iyr (Issue Year) - four digits; at least 2010 and at most 2020.
	#eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
	#hgt (Height) - a number followed by either cm or in:
	#If cm, the number must be at least 150 and at most 193.
	#If in, the number must be at least 59 and at most 76.
	#hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
	#ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
	#pid (Passport ID) - a nine-digit number, including leading zeroes.
	#cid (Country ID) - ignored, missing or not.
	

	NORTH_POLE_EXCEPTIONS = ["cid"]
	MANDATORY_FIELDS = Set.new([
		"byr",
		"iyr",
		"eyr",
		"hgt",
		"hcl",
		"ecl",
		"pid",
		"cid",
	  ])

	
	def initialize(input)
		@input_data = input.slice_when { |i,j| j.empty? || i.empty? }
						.reject { |arr| arr == [""] }
						.map { |e| e.flat_map(&:split) }
						.map { |e| e.map{ |f| f.split(":") }.to_h }
							
	end

	def validate_passports
		valid = @input_data.select { |e|  
			missing = e.keys.to_set ^ MANDATORY_FIELDS
			missing.empty? || missing.all? { |f| NORTH_POLE_EXCEPTIONS.include?(f)}
		}
	end

	def validate_passport_data 
		passports = validate_passports()

		matches = passports.count do |passport|
		
		(passport['byr'].to_i >= 1920 && passport['byr'].to_i <= 2020) &&
		(passport['iyr'].to_i >= 2010 && passport['iyr'].to_i <= 2020) &&
		(passport['eyr'].to_i >= 2020 && passport['eyr'].to_i <= 2030) && 
		passport['hcl'].to_s.match?(/^#[0-9a-f]{6}$/) &&
		valid_ecl?(passport['ecl']) && 
		valid_pid?(passport['pid']) &&
		valid_ght?(passport['hgt']) 
		end

		p matches
	end

	private 

	def valid_ecl?(ecl) 
		['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
			.include?(ecl)
	end

	def valid_pid?(pid) 
		pid.to_s.match?(/^\d{9}$/)
	end
	
	def valid_ght?(hgt) 
		return false if hgt.nil? || hgt.empty?
		
		unit = hgt.slice(-2,2)
		
		case unit
		when 'cm'
			hgt.to_i >= 150 && hgt.to_i <= 193
		when 'in'
			hgt.to_i >= 59 && hgt.to_i <= 76
		end
	end
end
