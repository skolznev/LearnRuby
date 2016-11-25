require_relative 'engine'

module Lift
	class Main

		def initialize
			@weight = 0
			@engine = Engine.new
		end

		def move floor
			@engine.floor = floor
			@engine.move
		end
	end
end

# p Lift::Main.new