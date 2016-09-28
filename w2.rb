massiv = []
puts 'Please, enter any word'
word = gets.chomp
massiv.push word
while word != ''
	puts 'Please, enter any word'
	word = gets.chomp
	massiv.push word
end
puts massiv.sort



puts
linewidth = 60
cont = ['Content']
chap = ['Chapter1','Chapter2','Chapter3']
name = ['Numbers','Words','Variables']
page = ['page1','page2','page3']
puts cont[0].center linewidth
puts ((chap[0] + ': ' + name[0]).ljust (linewidth/2)) + ((page[0]).rjust (linewidth/2))
puts ((chap[1] + ': ' + name[1]).ljust (linewidth/2)) + ((page[1]).rjust (linewidth/2))
puts ((chap[2] + ': ' + name[2]).ljust (linewidth/2)) + ((page[2]).rjust (linewidth/2))