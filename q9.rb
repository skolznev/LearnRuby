puts 'Say something granny :)'
word = gets.chomp
while word != 'BY'
	if word == word.upcase
	puts 'NO, NEVER WITH ' + rand(1930..1956).to_s + ' YEARS!'
	else
	puts 'WOT?! Speak louder, granddaughters!'
	end
	word = gets.chomp
end
puts 'BY, granddaughters!'