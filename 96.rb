class OrangeTree
	# height метод возвращения высоты
	# oneYearPasses метод увеличения возраста на 1 год
	# метод определения высоты дерева
	# когда дерево умрет (через сколько лет?)
	# первые несколько лет не плодоносит, потом все больше апельсинов
	# метод countTheOranges - считаем апельсины
	# (который уменьшает @orangeCount на единицу и возвращает строку с описанием, 
	# насколько вкусен был апельсин, или же он просто сообщает вам, что 
	# больше нет апельсинов для сбора в этом году). 
	# те апельсины, которые не собраны, должны опасть (в числовом варианте обозначить)
	def initialize name
		@name = name
		@heightMin = 0
		@heightMax = 5
		@yearMin = 0
		@yearMax = 10

		puts 'Сажаем ' + @name + ' и поливаем. Ждем...'
	end

	def oneYearPasses
		@year = @yearMin + 1
		@yearMin = @year
		if @year > @yearMax
			puts @name + ' засохло от старости. Пора сажать новое!'
			exit
		else
			puts @name + ' растет уже ' + @year.to_s + ' год(лет).'
		end
	end

	def height

		if @year <= 3
			@height = 1
		end
		if @year == 4 or @year == 5
			@height = 2
		end
		if @year == 6
			@height = 3
		end
		if @year == 7
			@height = 4
		end
		if @year == 8 or @year == 9 or @year == 10
			@height = 5
		end
		puts 'Его высота составляет ' + @height.to_s + ' метров.'
	end

	def countTheOranges
		if @year <= 3
			@orangeCount = 0
		end
		if @year == 4
			@orangeCount = 10			
		end
		if @year == 5
			@orangeCount = 15
		end
		if @year == 6
			@orangeCount = 20
		end
		if @year > 6
			@orangeCount = 30
		end
		@orangeCountZero = @orangeCount
		puts 'На дереве созрело ' + @orangeCount.to_s + ' апельсинов.'
	end

	def pickAnOrange
		@pic = @orangeCount.to_i - 1
		@orangeCount = @pic
		if @orangeCount <= 0
			puts 'На дереве нет апельсинов'
		else
			puts 'Срываем 1 шт. и на дереве осталось ' + @pic.to_s + ' шт.'
		end
	end

	def finishYear
		if @orangeCount > 0
			puts 'На дереве остались несобранными ' + @orangeCount.to_s + ' апельсинов. Урожай собран не весь :('
		end
		if @orangeCountZero == 0
			puts 'Дерево не плодоносило в этом году'
		end
		#if @orangeCount <= 0
			#puts 'Весь урожай успешно собран! Поздравляю! :)'
		#end
		
	end

end

tree = OrangeTree.new 'апельсиновое дерево'
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts

tree.oneYearPasses
tree.height
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.finishYear
puts
