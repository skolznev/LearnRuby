def doUntilFalse firstInput, someProc
	input = firstInput
	output = firstInput

	while output
		input = output
		output = someProc.call input
	end

	input
end

buildArrayOfSquares = Proc.new do |array|
	lastNumber = array.last
	if lastNumber <= 0
		false 
	else
		array.pop
		array.push lastNumber*lastNumber
		array.push lastNumber-1
	end
end

alwaysFalse = Proc.new do |justIgnoreMe|
	false
end

puts doUntilFalse([5], buildArrayOfSquares).inspect
puts doUntilFalse('Я пишу это в 3 часа утра; кто-то меня вырубил!', alwaysFalse)