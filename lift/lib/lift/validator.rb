module Lift
	module Validator

	MAX_WEIGHT = 250
	FLOOR_RANGE = 1..25

		def valid? *args

		end

		def check_floor_range!
			@error = "Mistake! Not found floor!" unless floor.instance_of?(Fixnum) && FLOOR_RANGE.cover?(floor)
		end

		def check_floor_curren!
			@error = "You are already on the #{floor}" if @current_flore == floor
		end

		def check_weight!
			@error = "Weight (#{@weight}kg) is more then allowed (#{MAX_WEIGHT}kg)" unless allowed_weight?
		end

		def allowed_weight?
			@weight <= MAX_WEIGHT
		end

	end
end