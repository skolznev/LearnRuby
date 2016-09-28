def bottlesNumber number
	while number > 0
		puts number.to_s + ' bottles of beer on the wall'
		puts number.to_s + ' bottles of beer'
		puts 'Take one down, pass it around'
		number = number - 1
		puts number.to_s + ' bottles of beer on the wall'
		puts ''
	end
	puts 'Well, come away! :)'
end
puts bottlesNumber (9999)