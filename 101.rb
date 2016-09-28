class Array

	def eachEven (&wasABlock_nowAProc)
		isEven = true
		self.each do |object|
			if isEven
				wasABlock_nowAProc.call object
			end

		isEven = (not isEven)
		end
	end
end

['яблоками', 'гнилыми яблоками', 'вишней', 'дурианом'].eachEven do |fruit|
	puts 'Ммм! Я так люблю пирожки с ' + fruit + ', а вы?'
end
[1,2,3,4,5].eachEven do |oddBall|
	puts oddBall.to_s + ' - НЕ четное число!'
end


