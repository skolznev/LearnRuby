puts 'What\'s your name?'
name = gets.chomp
puts 'What\'s your middle name?'
mname = gets.chomp
puts 'What\'s your surname?'
sname = gets.chomp
puts 'Hi, Mr. ' + name + ' ' + mname + ' ' + sname
puts 'Your name contain ' + name.length.to_s + ' symbols, your middle name contain ' + mname.length.to_s + ' symbols, your surname contain ' + sname.length.to_s + ' symbols. Wow! :) '
