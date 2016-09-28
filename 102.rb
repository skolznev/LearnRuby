def profile descriptionOfBlock, &block 
	startTime = Time.now

	block.call

	duration = Time.now - startTime

	puts descriptionOfBlock + ': ' + duration.to_s + ' сек.'
end

profile '25000 удваиваний' do
	number = 1
	25000.times do
		number = number + number
	end

	puts number.to_s.length.to_s + ' цифр'
end

profile 'сосчитать до миллиона' do
	number = 0

	1000000.times do
		number = number + 1
	end
end
