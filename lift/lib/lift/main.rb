require_relative 'engine'
require_relative 'validator'


module Lift
	class Main
		include Validator
		
		def initialize
			@weight = 0
			@engine = Engine.new
		end

		def move floor
			@engine.floor = floor

			if valid? :floor_range, :floor_current, :weight
				@engine.move
			else
				puts error
			end
		end

		def load! weight
		@weight += weight
		puts "[Load]: current weight is #{@weight}"
		end

		def release! weight
			@weight -= weight
			puts "[Release]: current weight is #{@weight}"
		end

	end
end

# p Lift::Main.new