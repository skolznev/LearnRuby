puts "Глава 10. Ввод/Вывод И Хранение Данных"

puts
puts "10.1. Файлы И Каталоги"

puts
puts "10.1.1. Открытие И Закрытие Файлов"

#file1 = File.new("one")
#file2 = File.new("two", "w")
#file3 = File.new("three", 0755, File::CREAT|File::WRONLY)

#file4 = File.new("captains.log", "w")
#kode
#file4.close

#file5 = File.open("trans", "w")

#File.open("somefile", "w") do |file|
 # file.puts "String1"
 # file.puts "String2"
 # file.puts "String3 and last String"
#end

puts
puts "10.1.2. Обновление Файла"

#file6 = File.new("file6", "r+")
#file7 = File.new("file7", "w+")
#file8 = File.new("file8", "a+")

puts
puts "10.1.3. Дописывание В Конец Файла"

#file9 = File.new("captains_log", "a")
#file9.puts "Stardate 47824.1: Our show has beeb canceled"
#file9.close

puts
puts "10.1.4. Прямой Доступ К Файлу"

#file10 = File.new("myfile")
#file10.seek(5)
#str = file10.gets

#file11 = File.new("fixedline")
#file11.seek(5*20)

#file12 = File.new("somefile")
#file12.seek(55)
#file12.seek(-22, IO::SEEK_CUR)
#file12.seek(47, IO::SEEK_CUR)

#file12.seek(20)
#position1 = file12.tell #20
#file12.seek(50, IO::SEEK_CUR)
#position2 = file12.pos #70

puts
puts "10.1.5. Работа С Двоичными Файлами"

File.open("myfile","wb") {|f| f.syswrite("12345\0326789\r")}
str = nil
File.open("myfile","rb") {|f| str = f.sysread(15)}
puts str.size

str = nil
File.open("myfile","r") {|f| str = f.sysread(15)}
puts str.size

#file = File.open("data")
#line = file.readline
#puts "#{line.size} symbols"
#file.close

puts
puts "10.1.6. Блокировка Файлов"

#file = File.new("somefile")
#file.flock(File::LOCK_EX)
#file.flock(File::LOCK_UN)
#file.flock(File::LOCK_SH)
#locked = file.flock(File::LOCK_EX | File::LOCK_NB)

puts
puts "10.1.7. Простой Ввод/Вывод"

putc(?\n)
putc("X")

puts
puts "10.1.8. Буферизованный И Небуферизованный Ввод/Вывод"

print "Hi..."
#STDOUT.flush
#sleep 5
print "By\n"

#p $defout.sync
#STDOUT.sync = false
#p STDOUT.sync

#p mystream.getc
#mystream.ungetc(?C)
#p mystream.getc

puts
puts "10.1.9. Манипулирование Правами Владения И Разрешениями На Доступ К Файлу"

#data = File.stat("somefile")
#owner_id = data.uid
#group_id = data.group_id

#perms = File.stat("somefile").mode

#uid = 201
#gid = 10

#File.chown(uid, gid, "alpha", "beta")
#f1 = File.new("delta")
#f1.chown(uid. gid)
#f2 = File.new("gamma")
#f2.chown(nil, gid)

#info = File.stat("/tmp/secrets")
#rflag = info.readable?
#wflag = info.writable?
#xflag = info.executable_real?

puts
puts "10.1.10. Получение И Установка Временных Штампов"

puts
puts "10.1.11. Проверка Существования И Получение Размера Файла"

p FileTest::exist?("D:/rb/2.rb")
p File.new("D:/rb/2.rb").stat.zero?
if File.new("D:/rb/2.rb").stat.size?
  puts "В файле есть данные"
else
  puts "пусто"
end

p File.size("D:/rb/2.rb")
p File.stat("D:/rb/2.rb").size

info = File.stat("D:/rb/2.rb")
p total_bytes = info.blocks
p total_bytes2 = info.blksize

puts
puts "10.1.12. Опрос Специальных Свойств Файла"

p FileTest::chardev?("D:/rb/2.rb")
p FileTest::blockdev?("D:/rb/2.rb")

p STDIN.tty?
p File.new("D:/rb/2.rb").isatty

p FileTest::pipe?("D:/rb/2.rb")
p FileTest::socket?("D:/rb/2.rb")

#file1 = File.new("D:/rb/2.rb")
#file2 = File.new("D:/rb/2.rb")
#p file1.directory?
#p file1.file?
#p file2.directory?
#p file2.file?

p File.ftype("D:/rb/2.rb")
#p File.new("D:/rb").stat.ftype

file = File.new("D:/rb/2.rb")
info = file.stat
p info.dev
p info.rdev
p info.ino

puts
puts "10.1.13. Каналы"

puts
puts "10.1.14. Специальные Операции Ввода/Вывода"

puts
puts "10.1.15. Неблокирующий Ввод/Вывод"

puts
puts "10.1.16. Применение Метода Readpartial"

puts
puts "10.1.17. Манипулирование Путевыми Именами"

str = "D:/rb/2.rb"
p dir = File.basename(str)
p File.basename(str,".rb")
p File.split(str)

#Dir.chdir("D:/rb/2.rb")
p File.expand_path("D:/rb/2.rb")

file = File.new("D:/rb/2.rb")
p file.path

p File.join("D:", "rb", "2.rb")

puts
puts "10.1.18. Класс Pathname"

require 'Pathname'

path = Pathname.new("D:/rb")
file = Pathname.new("2.rb")
p2 = path + file

p path.directory?
p path.file?
p p2.directory?
p p2.file?

p p1 = Pathname.new("//")
p p1.root?
p2 = Pathname.new("D:/rb/2.rb")
p p2.parent
#p2.children

puts
puts "10.1.19. Манипулирование Файлами На Уровне Команд"

#File.delete("D:/rb/test/1.rb")
#File.unlink("D:/rb/test/2.rb")
#File.rename("D:/rb/test/3.rb","D:/rb/test/1.rb")
#File.link("D:/rb/test/1.rb","D:/rb/test2/1.rb")
#File.symlink("D:/rb/test/1.rb","D:/Games/test/1.rb")
#File.truncate("D:/rb/test/6.rb",1000)

require "fileutils"

#p FileUtils.compare_file("D:/rb/test/1.rb","D:/rb/test/6.rb")

#FileUtils.copy("D:/rb/test/6.rb","D:/rb/test/1.rb")
#FileUtils.move("D:/rb/test/6.rb","D:/rb/test2")
#FileUtils.move("D:/rb/test/5.rb","D:/rb/test/7.rb")
#ileUtils.safe_unlink("D:/rb/test/5.rb","D:/rb/test/1.rb","D:/rb/test/4.rb")
#FileUtils.install("5.rb","D:/rb/test")

puts
puts "10.1.20. Ввод Символов С Клавиатуры"

require 'Win32API'

def getchar
char = Win32API.new("crtdll","_getch",[],'L').Call
end

puts
puts "10.1.21. Чтение Всего Файла В Память"

arr = IO.readlines("D:/rb/2.rb")
lines = arr.size
puts "Файл содержит #{lines} строк"

longest = arr.collect {|x| x.length}.max
puts "Самая длянная строка содержит #{longest} символов"

str = IO.read("D:/rb/2.rb")
bytes = arr.size
puts "Файл содержит #{bytes} байтов"
longest = arr.collect {|x| x.length}.max
puts "Самая длянная строка содержит #{longest} символов"

puts
puts "10.1.22. Построчное Чтение Из Файла"

IO.foreach("D:/rb/2.rb") do |line|
  puts line if line =~ /arr/
end

file = File.new("D:/rb/2.rb")
file.each do |line|
  puts line if line =~ /arr/
end

puts
puts "10.1.23. Побайтное Чтение Из Файла"

file = File.new("D:/rb/2.rb")
e_count = 0
file.each_byte do |byte|
  e_count += 1 if byte == ?e
end

puts
puts "10.1.24. Работа Со Строкой Как С Файлом"
    
require 'stringio'

ios = StringIO.new("abcdefghijkl\nABC\n123")
ios.seek(5)
ios.puts("xyz")

puts ios.tell

puts ios.string.dump

c = ios.getc
puts "c = #{c}"

ios.ungetc(?w)
puts ios.string.dump

puts "Ptr = #{ios.tell}"

puts
puts "10.1.25. Чтение Данных, Встроенных В Текст Программы"

#DATA.each_line do |line|
#  puts line.reverse
#end
#__END__
#A man, a plan, a canal... Panama!
#Madam, I'm Adam.
#,siht daer nac uoy fI
#.drah oot gnikrow neeb ev'uoy

puts
puts "10.1.26. Чтение Исходного Текста Программы"

#DATA.rewind
#num = 1
#DATA.each_line do |line|
#  puts "#{'%03d' % num} #{line}"
#  num += 1
#end
#__END__

puts
puts "10.1.27. Работа С Временными Файлами"

require 'tempfile'

temp = Tempfile.new("stuff")
p name = temp.path
temp.puts "I won't be here"
temp.close
p "later..."
temp.open
puts str = temp.gets
temp.close(true)

puts
puts "10.1.28. Получение И Изменение Текущего Каталога"

Dir.chdir("D:/rb/test2")
puts Dir.pwd
puts Dir.getwd

puts
puts "10.1.29. Изменение Текущего Корня"

puts
puts "10.1.30. Обход Каталога"

Dir.foreach("D:/rb") {|entry| puts entry}

dir = Dir.new("D:/rb")
dir.each {|entry| puts entry} 

puts
puts "10.1.31. Получение Содержимого Каталога"

p Dir.entries("D:/rb")

puts
puts "10.1.32. Создание Цепочки Каталогов"

require 'fileutils'
#FileUtils.makedirs("D:/rb/2/3/4/5/6/7")

puts
puts "10.1.33. Рекурсивное Удаление Каталога"

#require 'pathname'

#dir = Pathname.new("D:/2")
#dir.rmtree

puts
puts "10.1.34. Поиск Файлов И Каталогов"

#require 'find'

#   def findfiles(dir, name)
#    list = []
#    Find.find(dir) do |path|
#     Find.prune if [".",".."].include? Path
#     case name
#      when String
#       list << path if File.basename(path) == name
#      when Regexp
#       list << path if File.basename(path) =~ name
#      else
#       raise ArgumentError
#     end
#    end
#    list
#   end

#p findfiles "/home/hal", "toc.txt"

puts
puts "10.2. Доступ К Данным Более Высокого Уровня"

puts
puts "10.2.1. Простой Маршалинг"

works = [["Leonard Bernstein","Overture to Candide",11],
   ["Aaron Copland","Symphony No. 3",45],
   ["Jean Sibelius","Finlandia",20]]

File.open("D:/rb/test2/1.rb","w") do |file|
  Marshal.dump(works,file)
end

File.open("D:/rb/test2/1.rb") do |file|
  works = Marshal.load(file)
end

puts
puts "10.2.2. Более Сложный Маршалинг"

class Person
  attr_reader :name
  attr_reader :age 
  attr_reader :balance

  def initialize(name,birthdate,beginning)
    @name = name
    @birthdate = birthdate
    @beginning = beginning
    @age = (Time.now - @birthdate)/(365*86400)
    @balance = @beginning*(1.05**@age)
  end

  def marshal_dump
    Struct.new("Human",:name,:birthdate,:beginning)
    str = Struct::Human.new(@name, @birthdate, @beginning)
    str
  end

  def marshal_load(str)
    self.instance_eval do
      initialize(str.name, str.birthdate, str.beginning)\
    end
  end
end

p1 = Person.new("Rudy",Time.now - (14 * 365 * 86400), 100)
p [p1.name, p1.age, p1.balance]

str = Marshal.dump(p1)
p2 = Marshal.load(str)

p [p2.name, p2.age, p2.balance]

puts
puts "10.2.3. Ограниченное «Глубокое Копирование» В Ходе Маршалинга"

puts
puts "10.2.4. Обеспечение Устойчивости Объектов С Помощью Библиотеки PStore"

#require 'pstore'

#db = PStore.new("employee.dat") db.transaction do
#  db["params"] = {"name" => "Fred", "age" => 32, "salary" => 48000}
#end

#require "pstore"
#db = PStore.new("employee.dat")
#emp = nil
#db.transaction { emp = db["params"]}

puts
puts "10.2.5. Работа С Данными В Формате CSV"

require 'csv'

CSV.open("data.csv","w") do |wr|
  wr << ["name", "age", "salary"]
    wr << ["mark", "29", "34500"]
    wr << ["joe", "42", "32000"]
    wr << ["fred", "22", "22000"]
    wr << ["jake", "25", "24000"]
    wr << ["don", "32", "52000"]
end

#CSV.open("data.csv", "r") do |row|
#  p row
#end

puts
puts "10.2.6. Маршалинг В Формате YAML"

require 'yaml'

str = "Hello, World"
num = 237
arr = %w[Jun Feb Mar Apr]
hsh = {"This" => "is", "just a" => "hash."}

puts str.to_yaml
puts num.to_yaml
puts arr.to_yaml
puts hsh.to_yaml

puts
puts "10.2.7. Преобладающие Объекты И Библиотека Madeleine"

puts
puts "10.2.8. Библиотека DBM"

#require 'dbm'
#d = DBM.new("data")
#d["123"] = "toodle-oo"
#d.close
#puts d["123"]

#e = DBM.open("data")
#e["123"]
#w = e.to_hash
#e.close

#puts e["123"]
#puts w["123"]

puts
puts "10.3. Библиотека KirbyBase"

puts
puts "10.4. Подключение К Внешним Базам Данных"

puts
puts "10.4.1. Интерфейс С SQLite"

puts
puts "10.4.2. Интерфейс С MySQL"

puts
puts "10.4.3. Интерфейс С PostgreSQL"

puts
puts "10.4.4. Интерфейс С LDAP"

puts
puts "10.4.5. Интерфейс С Oracle"

puts
puts "10.4.6. Обертка Вокруг DBI"

puts
puts "10.4.7. Объектно-Реляционные Отображения (ORM)"




