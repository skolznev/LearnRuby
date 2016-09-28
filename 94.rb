class Die
	def initialize
		roll
	end

	def roll
		@numberShowing = 1 + rand(6)
	end

	def showing
		@numberShowing
	end
	def cheat
		roll
	end
end

die = Die.new
die.cheat
puts die.showing
puts 'Сторона - ' + (die.showing).to_s
