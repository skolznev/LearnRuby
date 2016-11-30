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

# ary = [1,2]

# def add ary, val
# 	ary_clone = ary.clone
# 	ary_clone.push val
# end

# p ary
# p add ary, 7
# p ary

# class Point

# 	def initialize x, y
# 		@x = x #переменные экземпляра
# 		@y = y
# 	end

# 	def hello
# 		puts "Hello, Ruby! I'm point: x = #{@x}, y = #{@y}"
# 	end

# 	def to_s #для вывода puts
# 		"Point: (#{@x};#{@y})"
# 	end

# 	def inspect #для вывода p
# 		"Point: (#{@x};#{@y};id:<#{object_id}>)"
# 	end

# 	def x
# 		@x
# 	end

# 	def x= val
# 		@x = val
# 	end
# end
# point = Point.new 25, 110
# p point
# puts point
# point.x = 0
# p point.x

# point = Point.new
# point2 = Point.new

# p point.__id__
# p point2.__id__

# p point.class

# class Point

# 	attr_accessor :x, :y
# 	# # attr_reader :x, :y
# 	# # attr_writer :x, :y

# 	def initialize x, y
# 		p self
# 		@x = x #переменные экземпляра
# 		@y = y
# 		@z = 100
# 	end

# 	def hello
# 		puts "Hello, Ruby! I'm point: x = #{@x}, y = #{@y}"
# 	end

# 	def to_s #для вывода puts
# 		p self
# 		"Point: (#{@x};#{@y})"
# 	end

# 	def inspect #для вывода p
# 		"Point: (#{@x};#{@y};id:<#{object_id}>)"
# 	end

# end

# point = Point.new 25, 110
# p point
# puts point
# point.x = 0
# p point.x

# 


# class Lift

# 	MAX_WEIGHT = 250
# 	FLOOR_RANGE = 1..25

	#Интерфейс
	# def initialize
	# 	@current_flore = 1
	# 	@weight = 0
	# end
 
	# def move floor
	# 	return puts("Mistake! Not found floor!") unless floor.instance_of?(Fixnum) && FLOOR_RANGE.cover?(floor)
	# 	return puts("Weight (#{@weight}kg) is more then allowed (#{MAX_WEIGHT}kg)") unless allowed_weight? #за исключением
	# 	return puts("You are already on the #{floor}") if @current_flore == floor
	# 	if floor > @current_flore
	# 		up floor
	# 	else
	# 		down floor
	# 	end
	# 	set_current_floor! floor
	# 	puts "Stop. You are on the #{@current_flore} floor"

	# end

# 	def load! weight
# 		@weight += weight
# 		puts "[Load]: current weight is #{@weight}"
# 	end

# 	def release! weight
# 		@weight -= weight
# 		puts "[Release]: current weight is #{@weight}"
# 	end

# 	def to_s
# 		"Lift with load #{@weight}kg on the #{@current_flore} floor"
# 	end


# 	#Реализация
# 	private

# 	def allowed_weight?
# 		@weight <= MAX_WEIGHT
# 	end

# 	def up floor
# 		puts "Moving up..."
# 		@current_flore.upto(floor) do |i|
# 			puts "#{i} floor"
# 		end
# 	end

# 	def down floor
# 		puts "Moving down..."
# 		@current_flore.downto(floor) do |i|
# 			puts "#{i} floor"
# 		end
# 	end

# 	def set_current_floor! floor
# 		@current_flore = floor
# 	end

# end

# lift = Lift.new

# lift.load! 40
# lift.load! 140
# lift.load! 100
# lift.release! 100

# lift.move 7
# lift.move 2

# class Module

# 	def module?
# 		self.class == Module
# 	end

# end

# module Warp
# end

# class Ship
# end

# puts Ship.module?
# puts Warp.module?

# ex 4, time: 1.44.10


# def operation
# 	yield "Hello, block from operation" # произвести вычисление блока
# end

def operation &block
	block.call "Hello, block from operation"
end

operation do |text = nil|
	p text	
end

# operation { 1 + 1 }

# ex 4, time: 2.09.50