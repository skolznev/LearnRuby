# require 'C:\Users\User\Google Диск\my programming\ruby\tests\lift\lib\lift\main.rb'
# require File.expand_path('..\lift\main.rb',__FILE__) #относительно текущего файла! Как в html
require_relative 'lift\main.rb' # Лучший способо! Относительно текущего файла! Как в html

module Lift

	def self.create
		Main.new
	end

	def self.version
		'1.0.0'
	end

end

lift = Lift.create
# lift = Lift::Main.new

# lift = Lift.version

# lift = Lift.load! 40

lift.load! 50
lift.load! 140
lift.load! 100
lift.release! 100
puts Lift.version
lift.move 7
lift.move 7
lift.move 2