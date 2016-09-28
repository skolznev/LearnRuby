$width = 60

def log &block
	puts 'Начинаю "внешний блок"...'
	block.call
	puts '..."внешний блок" закончен, вернул: ' + @m.to_s
end
def log2 &block

	puts ('Начинаю "другой небольшой блок"...').rjust $width
	block.call
	puts ('..."другой небольшой блок" закончен, вернул: ' + @s.to_s).rjust $width
end
def log3 &block
	puts ('Начинаю "еще один блок"...').rjust $width*1.2
	block.call
	puts ('..."еще один блок" закончен, вернул: ' + @f.to_s).rjust $width*1.2
end

log do
	log2 do
		@s = 2 + 3
	end
		log3 do
			@f = 'Мне нравится тайская еда!'
		end
	@m = false
end