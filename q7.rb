puts 'Hi, what is your name?'
name = gets.chomp
if name == name.capitalize
	puts 'Sit down please' + name + '.'
else
	puts name + '? May be: ' + name.capitalize + ', dont you?'
	puts 'Repeat!'
	reply = gets.chomp
	if reply == 'yes'
		puts 'Well, sit down'
	else
		puts 'Go away!!!!!'
	end
end