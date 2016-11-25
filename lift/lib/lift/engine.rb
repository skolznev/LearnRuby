module Lift
	class Engine

		attr_reader :current_flore
		attr_accessor :floor
		
		def initialize
			@current_flore = 1
		end

		def move
			@floor > @current_flore ? up : down
			set_current_floor!
		end


		private

		def up
			puts "Moving up..."
			@current_flore.upto(floor) do |i|
				puts "#{i} floor"
			end
		end

		def down
			puts "Moving down..."
			@current_flore.downto(floor) do |i|
				puts "#{i} floor"
			end
		end

		def set_current_floor!
			@current_flore = floor
		end

	end
end

