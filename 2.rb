#GeekBrains Ruby&Rails

# cls - очистка командной строки
# irb - оболочка руби

#v1, time = 1.04.04

#Ctrl + B - вычисление в Sublime
# = - присвоение
# == - сравнение
# === - принадлежность

#class Fixnum

#	def + value
#		self - value
#	end

#end

#p 1 + 6

# user = {
# 	name: 'Spider-man',
# 	role: :superhero
# }

# result = if user[:role] == :superhero
# 	user[:name] + ' please, help us!'
# else
# 	"Let's hide in the wood"
# end

# puts result

# result = unless user[:role] == :superhero #unless - за исключением
# 	"Let's hide in the wood"
# else
# 	user[:name] + ' please, help us!'
# end

# puts result

# result = if user[:role] == :superhero
# 	"Protect people from evil monsters!"
# elsif user[:role] = :policman
# 	user[:name] + ' please, help us!'
# else
# 	"Let's hide in the wood"
# end

# puts result

 # puts "t" unless user[:role] == :superhero

 # case user[:role]
 # when :superhero
 # 	puts "superhero"
 # when :p
 # 	puts "p"
 # else
 # 	puts "else" 	
 # end

# Циклы
# toolkits = %w(IDE Rube Coffee)
# for tool in toolkits
# 	puts "I use #{tool}"
# end

# index = 0
# while index < toolkits.length
# 	puts "I use #{toolkits[index]}"
# 	index += 1
# end

# index = 0
# until index >= toolkits.length
# 	puts "I use #{toolkits[index]}"
#  	index += 1
# end

# index = 0
# begin
# 	puts "I use #{toolkits[index]}"
# 	index += 1
# end while index < toolkits.length

# puts "t" while toolkits.length > 0

# toolkits = [ 'IDE', 'Rube', 'Coffee', 1, :one, Object.new ]

# toolkits.each{ |tool| puts "I use #{tool}" }

 # i = toolkits.each
# p i.size
# p i.next
# p i.rewind

# loop do
# 	p i.next
# end

# num = (5..15).to_a
# # p num.map!{|number| number ** 2}
# # p num

# res = num.inject(0) do |sum , number| #|аккумулятор, элемент массива|
# 	puts "Current element: #{number}"
# 	sum + number
# end

# p res

# def cube val, degree=2
# 	val ** degree
# end

# p cube 5, 6

# def sum *args
# 	args.inject :+
# end

# p sum 1,2,3,4

38:00
