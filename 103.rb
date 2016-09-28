# Дедушкиы часы
def clock (&block)
	hour = Time.now.hour
	while hour > 0
		hour = hour - 1
		block.call
	end
end

clock do
	puts 'BOM!'
end

 