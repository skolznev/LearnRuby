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

# def operation &blk
# 	# block.call "Hello, block from operation"
# 	p blk.class
# end

# operation do |text = nil|
# 	p text	
# end

# operation { 1 + 1 }


# catch :a do
# 	1+1
# 	# throw :a
# 	puts "1"
# end

# puts "2"


# begin
# 	1 / 0
# 	# hey!
# 	require 'hz'
# # rescue ZeroDivisionError
# # 	p "zero"
# # rescue LoadError
# # 	p "no lib"
# rescue Exception
# 	p "Exception"
# end

# result = 1 / 0 rescue nil
# p result

# "Рескью нил, рескью нил, мою жизнь он изменил )))"

# def warp!
# 	1 / 0
# rescue => error 
# 	p "Ups", error.message
# end
# warp!

# class Ship

# 	class NotEnoughFluelError < StandardError

# 	end

# 	def initialize fuel
# 		@fuel = fuel
# 	end

# 	def warp_jump
# 		# # puts "I can't do warp jump! I need more fuel!"
# 		# raise NotEnoughFluelError, "Not enough fuel" if @fuel < 200
# 		# puts "It's OK! Warp jump complite!"
# 	end

# end

# Ship.new(0).warp_jump

# require 'net/http'
# require 'open-uri'

# class RunningTrack

# 	DATA_URL = "http://www.virtualsoccer.ru/viewmatch.php?day=12557&match_id=181106"

# 	def self.import
# # 		# Net::HTTP.get "virtualsoccer.ru", '/viewmatch.php?day=12557&match_id=181106'
# # 		uri = URI(DATA_URL)
# # 		Net::HTTP.get uri
		
# 		open(DATA_URL).each_line do |line|
# 			puts line
# 		end
# 	end

# 	def self.import_file
# 		open 'C:\Users\User\Google Диск\my programming\ruby\tests\92.rb'
# 	end

# end

# puts RunningTrack.import_file.read

# require 'workflow'
# class Player

# end

# def output_first_chars *args
# 	# options = args.extract_options!
# 	# p args
# 	args.each do |s|
# 		puts s[0...3]
# 	end
# end

# output_first_chars "First string", "Second string", length: 3


# require 'active_support/all'
# class User
# 	include ActiveSupport::Configurable
# end

# class Player < User
# end

# User.config.admin = true
# admin = User.new
# puts admin.config


# Player.config.admin = true
# p User.config.admin
# p User.config

# class Class
# class Ship

# 	@sname = :battleship #переменная экземпляра класса

# 	attr_reader :sname
# 	def initialize
# 		@sname = 'Zeus' #переменная экземпляра
# 	end

# 	# def self.sname #свой спец метод для переменной экземпляра класса
# 	# 	@sname
# 	# end

# 	class << self
# 		attr_reader :sname
# 	end

# end
# # end

# p Ship.new.sname
# p Ship.sname


# class Tetragon

# 	@@sides = 4

# 	def get_sides
# 		@@sides 	#Переменные класса
# 	end

# 	def self.get_sides
# 		@@sides
# 	end

# end

# class Triangle < Tetragon

# 	def change_sides!
# 		@@sides = 3
# 	end

# end

# Triangle.new.change_sides!
# p Tetragon.new.get_sides
# p Triangle.get_sides

# require 'rack'

# app = Proc.new do |env|
# 	p env
# 	[ 200, {"Content-Type" => "text/plain"}, [ "Hello, Rack!\n" ] ]
# end


# class SuperApp

# 	def initialize
# 		puts "Create app"
# 	end

# 	def call env
# 		@request = Rack::Request.new env
# 		@response = Rack::Response.new
# 		p @request.params
# 		# [ 200, { "App" => "SuperApp" }, [ "Hello, Rack!\n" ] ]
# 		send_response
# 	end

# 	def body
# 		<<-HTML
# 		<!DOCTYPE html>
# 		<html>
# 		<head>
# 			<title></title>
# 		</head>
# 		<body>
# 		<form action="/send_name" method="POST">
# 			<input type="text" name="name">
# 			<input type="submit" value="Send">
# 		</form>
# 		</body>
# 		</html>
# 		HTML
# 	end

# 	private

# 	def send_response
# 		@response.write body
# 		@response.finish
# 	end
# end

# # Rack::Handler::WEBrick.run SuperApp.new
# # builder.run app

# class NameController < SuperApp

# 	def body
# 		name = @request.params['name']
# 		"Your name is #{name}"
# 	end

# end

# info = Proc.new do |env|
# 	[ 200, {}, ["Created and running on Rack.\n"]]
# end

# builder = Rack::Builder.new do

# 	# use Rack::Reloader

# 	map '/' do
# 		run SuperApp.new
# 	end

# 	map '/send_name' do
# 		# use Rack::Reloader
# 		run NameController.new
# 	end

# 	# map '/info' do
# 	# 	run info
# 	# end
# end

# # builder.use Rack::Reloader

# Rack::Handler::WEBrick.run builder

# # ex 13, time: 00.48.48 локализация данных

# puts `rails -v`

#Регулярные выражения
