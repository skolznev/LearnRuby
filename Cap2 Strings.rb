#Какими могут быть СТРОКИ в Ruby
s1 = 'Это строка'
s2 = 'It\'s string'
s3 = 'Смотри в C:\\Temp'
puts s1
puts s2
puts s3
puts
s4 = "Это знак табуляции: (f\tf)"
s5 = "Несколько символов забоя: xyz\b\b\b"
s6 = "Это тоже знак табуляции: f\011f"
s7 = "А это символы подачи звукового сигнала: f\a\007f"
puts s4
puts s5
puts s6
puts s7
puts
s8 = %q[Как сказал Магритт, "Ceci n'est pas une pipe."]
s9 = %q[Это не табуляция: (\t)]
s10 = %Q[А это табуляция: (\t)]
puts s8
puts s9
puts s10
puts
s11 = %q(Билл сказал: "Боб сказал: 'This is a string.'")
s12 = %q{Another string.}
s13 = %q<В этой строке есть специальные символы '"{}()[].>
puts s11
puts s12
puts s13
puts
s14 = %q:"Я думаю, что это сделала корова г-жи О'Лори," сказал он.:
s15 = %q*\r - it's control-M, and \n - it's control-J.*
puts s14
puts s15
puts
s16 = "Три девицы под окном
Пряли поздно вечерком..."
puts s16
puts
s17 = <<EOF
Три девицы под окном
Пряли поздно вечерком...
EOF
puts s17
puts
s18 = <<'EOF'
Это не знак табуляции: \t
а это не символ новой строки: \n
EOF
puts s18
puts
s19 = <<-EOF
  Каждая из этих строк
  начинается с пары
  пробелов.
EOF
puts s19
puts
#пример
class String
	def margin
		arr = self.split("\n")#Разбить на строки
		arr.map! {|x| x.sub!(/\s*\|/,"")} #Удаляем начаьные символы
		str = arr.join("\n") #Объединяем в одну строку
		self.replace(str) #Подменить исходную строку
	end
end
str = <<end.margin
	|Этот встроенны документ имеет "левое поле"
	|на уровне вертикальной черты в каждой строке.
	|
	|Можно включать цитаты,
	|делать отступы ит.д.
end
puts str
str1 = "Karl"
s20 = str1.length
str2 = "Doill"
s21 = str2.size
puts s20
puts s21
puts
#Построчная обработка
#s22 = "Когда-то\nдавным-давно...\nКонец\n"
#num = 0
#s22.each do |line|
#	num += 1
#	print "Строка #{num}: #{line}"
#end

 #Побайтовая обработка
s23 = "ABC"
s23.each_byte {|char| print char, " "}
puts
s24 = "ABC"
chars = s24.scan(/./)
chars.each {|char| print char, " "}
puts
#Разбиение на лексемы
s25 = "Была,темная,грозовая,ночь,,"
puts s25.split(",")
puts
puts s25.split(",",2)
puts
puts s25.split(",",4)
puts
puts s25.split(",",4)
puts
puts s25.split(",",-1)
puts
s26 = "I am a leaf on the wind..."
puts s26.scan("a")
puts
puts s26.scan(/\w+/)
puts
puts s26.scan(/\w+/) { |x| puts x  }
puts
#Форматирование строк
s27 = "Bob"
s28 = 28
puts sprintf("Привет, %s... Похоже, тебе %d лет.", s27, s28)
puts sprintf("%-20s %3d", s27, s28)
puts "%-20s %3d" % [s27,s28]
s29 = "Моби Дик"
puts s29.ljust(12)
puts s29.center(12)
puts s29.rjust(12)
s30 = "Капитан Ахав"
puts s30.ljust(20,"+")
puts s30.center(20,"-")
puts s30.rjust(20,"123")
#Управление регистром
puts
s31 = "Boston tea"
puts s31.downcase
puts s31.upcase
s32 = "BOSTON TEA"
puts s32.capitalize
puts s31.swapcase
puts
s33 = "abc".casecmp("xyz")
puts s33
#2.12. Вычленение И Замена Подстрок
puts

s34 = "Шалтай-Болтай"
puts s34[7,4]
puts s34[7,99]
puts s34[10,-4]
puts
s35 = "Алиса"
puts s35[-3,3]
s36 = "В Зазеркалье"
puts s36[-8,6]
puts
s37 = "Уинстон Черчилль"
puts s37[8..13]
puts s37[-4..-1]
puts s37[-1..-4]
puts s37[25..30]
puts
s38 = "Alistair Cooke"
puts s38[/1..t/]
puts s38[/s.*r/]
puts s38[/foo/]
puts
s39 = "theater"
puts s39["heat"]
puts s39["eat"]
puts s39["ate"]
puts s39["beat"]
puts
s40 = "Aaron Burr"
puts s40[0]
puts s40[1]
puts s40[99]
#Замена строк
s34[7,3] = "Хва"
puts s34
s35[-3,3] = "ександра"
puts s35
s36[-8,8] = "стеколье"
puts s36
s37[8..11] = "X"
puts s37
s38[/e$/] = "ie Monster"
puts s38
s39["er"] = "re"
puts s39
#s40[0] = 66 - не работает почему-то
#puts s40
#2.13. Подстановка В Строках
puts
s41 = "spam, spam, and eggs"
s42 = s41.sub(/spam/,"bacon")
puts s42.sub(/(\w+), (\w+),/,'\2, \1,')
s43 = "Don't forget the spam."
puts s43.sub(/spam/) { |m| m.reverse }
s44 = s43.sub!(/spam/) { |m| m.reverse }
puts s44
puts
s45 = "alfalfa abracadabra"
s46 = s45.gsub(/a[bl]/,"xx")
puts s45.gsub!(/[lfdbr]/) { |m| m.upcase + "-" }
#2.14. Поиск В Строке
puts
s47 = "Albert Einstein"
puts s47.index(?E)
puts s47.index("bert")
puts s47.index(/in/)
puts s47.index(?W)
puts
puts s47.rindex(?E)
puts s47.rindex("bert")
puts s47.rindex(/in/)
puts s47.rindex(?W)
puts
s48 = "abracadabra"
puts s48.scan(/a./)
s49 = "Acapulco, Mexico"
puts s49.scan(/(.)(c.)/)
puts
s50 = "Kabayashi"
s50.scan(/["aeiou]+[aeiou]/) do |x|
print "Слог: #{x}\n" end
#2.15. Преобразование Символов В Коды ASCII И Обратно
s51 = "Martin"
print s51[0]
puts
print s51<<111
#2.16. Явные И Неявные Преобразования
puts
class Helium
	def to_s
		"He"
	end
	def to_str
		"гелий"
	end
end

s52 = Helium.new
print "Элемент"
puts s52
puts "Элемент " + s52
puts "Элемент #{s52}"
#2.17. Дописывание В Конец Строки
puts
s53 = "A"
puts s53<<[1,2,3].to_s<<" "<<(3.14).to_s
s54 = "Marlow"
puts s54<<101<<", Christopher"
#2.18. Удаление Хвостовых Символов Новой Строки И Прочих
puts
#puts gets.chop
s55 = "Some string\n"
puts s55.chop!
s56 = "Other string\r\n"
puts s56.chop!
s57 = "фисчня"
puts s57.chomp #chop удаляет последний символ всегда
#2.19. Удаление Лишних Пропусков
puts
s56 = "\t\nabc\t\n"
puts s56.strip
puts s56.strip!
s57 = " abc "
puts s57.lstrip
puts s57.rstrip
#2.20. Повтор Строк
puts
puts "Etc. "*3
puts " + " + (". "*4+"5"+"."*4+" + ")*3
#2.21. Включение Выражений В Строку
puts
puts "Ответ равен #{ def factorial(n)
n == 0 ? 1 : n*factorial(n-1)
end
answer = factorial(3)*7}, естественно."
#2.22. Отложенная Интерполяция
puts
s58 = proc{|x,y,z| "Числа равны #{x}, #{y} и #{z}"}
puts s58.call(3,4,5)
puts s58.call(7,8,9)
s59 = '#{name} - my name, and #{nation} - my country'
name, nation = "Stiven Dedal", "Irland"
puts eval('"' + s59 + '"')
#2.23. Разбор Данных, Разделенных Запятыми
s60 = "Doe, John", 35, 225, "5'10\"","555-0123"
s61 = eval("[" + s60.to_s + "]")
s61.each {|x| puts "Значение = #{x}"} #неверно работает!!!!

#2.24. Преобразование Строки В Число (Десятичное Или Иное)
puts
puts "123".to_i
puts Integer("123")
puts "123junk".to_i
#puts Integer("123junk") - выдает ошибку
puts "3.1416".to_f
puts Float("2.718")
puts Integer("0b111")
puts Integer("0111")
puts Integer("0x111")
puts "0b111".to_i
puts "0111".to_i
puts "0x111".to_i
puts
puts "111".to_i(2)
puts "111".to_i(8)
puts "111".to_i(16)
puts
puts "123".to_i(5)
puts "riby".to_i(36)
s62 = "234 234 234"
#puts s62.scanf("%d %o %x")
class String
	def rot13
		self.tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
	end
end
s63 = "Y2K bug"
puts s63.rot13
s64 = "Fcbvyre: Naanxva qbrfa'g trg xvyyrq"
puts s64.rot13
#2.26. Шифрование Строк
puts
#coded = "hfCghHIE5LAM."
#puts "Говори, друг, и жми Ентер"
#print "Пароль: " 
#password = gets.chop
#if password.crypt("hf") == coded
#	puts "Добро пожаловать!"
#else
#	puts "Кто ты, орк?"
#end

#2.27. Сжатие Строк
#require 'zlib'
#include Zlib
#s65 = ("abcde"*71 + "defghi"*79 + "ghijkl"*113)*371
#puts Deflate.deflate(s65,BEST_SPEED)
#puts Deflate.deflate(s65)
#puts Deflate.deflate(s65,BEST_COMPRESSION)

#2.28. Подсчет Числа Символов В Строке
s66 = "abracadabra"
puts s66.count("c")
puts s66.count("bdr")
puts s66.count("^a")
puts s66.count("^bdr")
puts s66.count("a-d")
puts s66.count("^a-d")

#2.29. Обращение Строки
puts
s67 = "Star Trek"
puts s67.reverse

#2.30. Удаление Дубликатов
puts
s68 = "bookkeeper"
puts s68.squeeze
s69 = "Hello......"
puts s69.squeeze(".")

#2.31. Удаление Заданных Символов
puts
s70 = "To be, or not to be"
puts s70.delete("b")
s71 = "Veni, vidi, vici!"
puts s71.delete(",!")

#2.32. Печать Специальных Символов
puts
s72 = "Dangeres!" <<7 <<7 <<7
puts s72.dump
s73 = "abc\t\tdef\tghi\n\n"
puts s73.dump
s74 = "Dvoinaya kavichka: \""
puts s74.dump
#русский яз не понимает!

#2.33. Генерирование Последовательности Строк
puts
s75 = "R2D2"
puts s75.succ
s76 = "Vitamin B"
puts s76.succ
#2.34. Вычисление 32-Разрядного CRC
require 'zlib'
include Zlib
s77 = crc32("Hello")
puts crc32("Hello",s77)
puts crc32(" world!",)
puts crc32("Hello world!")
#2.35. Вычисление МD5-Свертки Строки
puts
#require 'md5'
#puts MD5.new("Secret data").hexdigest

#2.36. Вычисление Расстояния Левенштейна Между Двумя Строками
#СЛОЖНААААА! :(

#2.37. Base64-Кодирование И Декодирование
s78 = "\007\007\002\abdce"
puts s78
s79 = [s78].pack("m")
puts s79.unpack("m")

#2.38. Кодирование И Декодирование Строк (Uuencode/Uudecode)
s78 = "\007\007\002\abdce"
puts s78
s79 = [s78].pack("u")
puts s79.unpack("u")
#2.39. Замена Символов Табуляции Пробелами И Сворачивание Пробелов В Табуляторы
#Тоже СЛОЖНААААА :(

#2.40. Цитирование Текста
s80 = <<-EOF
     When in the Course of human events it becomes necessary
     for one people to dissolve the political bands which have
     connected them with another, and to assume among the powers 
     of the earth the separate and equal station to which the Laws
     of Nature and of Nature's God entitle them, a decent respect
     for the opinions of mankind requires that they should declare the
     causes which impel them to the separation.
   EOF
 
   max = 20
 
   line = 0
   out = [""]
 
   input = s80.gsub(/\n/, " ")
   words = input.split(" ")
   while input != ""
    word = words.shift
    break if not word
    if out[line].length + word.length > max
     out[line].squeeze!(" ")
     line += 1
     out[line] = ""
    end
    out[line] << word + " "
   end

   out.each {|line| puts line}