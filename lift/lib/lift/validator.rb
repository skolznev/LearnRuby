module Lift
	module Validator

	MAX_WEIGHT = 250
	FLOOR_RANGE = 1..25

	attr_reader :error

		def valid? *args
			clear_error!

			args.each do |validator_name|
				self.send "check_#{validator_name}!"
			end

			@error.nil? ? true : false
		end

		def clear_error!
			@error = nil
		end


		private

		def check_floor_range!
			@error = "Mistake! Not found floor!" unless @engine.floor.instance_of?(Fixnum) && FLOOR_RANGE === @engine.floor
		end

		def check_floor_current!
			@error = "You are already on the #{@engine.floor}" if @engine.current_flore == @engine.floor
		end

		def check_weight!
			@error = "Weight (#{@weight}kg) is more then allowed (#{MAX_WEIGHT}kg)" unless allowed_weight?
		end

		def allowed_weight?
			@weight <= MAX_WEIGHT
		end

	end
end