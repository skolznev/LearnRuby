class Dragon
	def initialize name
		@name = name
		@asleep = false
		@stuffInBelly = 10 # Он сыт
		@stuffInIntestine = 0 # Хочет гулять

		puts @name + ' родился.'
	end

	def feed
		puts 'Вы кормите ' + @name + '(a).'
		@stuffInBelly = 10
		passageOfTime
	end

	def walk
		puts 'Вы выгуливаете ' + @name + '(a).'
		@stuffInIntestine = 0
		passageOfTime
	end

	def putToBed
		puts 'Вы укладываете ' + @name + '(a).'
		@asleep = true
		3.times do 
			if @asleep
				passageOfTime
			end
			if @asleep
				puts @name + ' храпит, наполняя комнату дымом.'
			end
		end

		if @asleep
			@asleep = false
			puts @name + ' медленно просыпается.'
		end
	end

	def toss
		puts 'Вы подбрасываете ' + @name + '(a) в воздух.'
		puts 'Он хихикает, обжигая при этом вам брови.'
		passageOfTime
	end

	def rock
		puts 'Вы нежно укачиваете ' + @name + '(a).'
		@asleep = true
		puts 'Он быстро задрёмывает...'
		passageOfTime
		if @asleep
			@asleep = false
			puts '...но просыпается, как только вы перестали качать.'
		end
	end

	private
	#  "private" означает, что определённые здесь методы являются
  	#  внутренними методами этого объекта.  (Вы можете кормить
  	#  вашего дракона, но не можете спросить его, голоден ли он.)

	def hungry? #  голоден?
    	#  Имена методов могут заканчиваться знаком "?".
    	#  Как правило, мы называем так только, если метод
    	#  возвращает true или false, как здесь:
 		@stuffInBelly <= 2
 	end

 	def poopy? #уишечник полон?
 		@stuffInIntestine >= 8
 	end

 	def passageOfTime #проходит некоторое время
 		if @stuffInBelly > 0
 			# перемещаем пищу из желудка в кишечник.
 			@stuffInBelly = @stuffInBelly - 1
 			@stuffInIntestine = @stuffInIntestine + 1
 		else # Наш дракон страдает от голода!
 			if @asleep
 				@asleep = false
 				puts 'Он внезапно просыпается!'
 			end
 			puts @name + ' проголодался! Доведенный до крайности, он съедает Вас!'

 			exit 
 		end

 		if @stuffInIntestine >= 10
 			@stuffInIntestine = 0
 			puts 'Опаньки! ' + @name + ' сделал нехорошо....'
 		end

 		if hungry?
 			if @asleep
 				@asleep = false
 				puts 'Он внезапно просыпается!'
 			end
 			puts 'В желудке у ' + @name + '(а) урчит...'
 		end

 		if poopy?
 			if @asleep
 				@asleep = false
 				puts 'Он внезапно просыпается!'
 			end
 			puts @name + ' подпрыгивает, потому что хочет на горшок...'
 		end
 	end
 end
 
 pet = Dragon.new 'Александр'
 pet.feed
 pet.toss
 pet.walk
 pet.putToBed
 pet.rock
 pet.putToBed
 pet.putToBed
 pet.putToBed
 pet.putToBed