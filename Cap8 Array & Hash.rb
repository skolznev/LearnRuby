puts "Глава 8. Массивы, Хэши И Другие Перечисляемые Структуры"
puts
puts "8.1.1. Создание И Инициализация Массива"
puts
p Array.new
p Array.new(3)
p arr1 = Array.new(3, "bla")
p arr1[0].capitalize!
p arr2 = Array.new(3) { "bla" }
p arr2[0].capitalize!
puts "8.1.2. Доступ К Элементам Массива И Присваивание Им Значений"
puts
arr3 = [1, 2, 3, 4, 5, 6]
puts arr3[0]
puts arr3.at(0)
puts arr3[-2]
puts arr3.at(-2)
p arr3[9]
p arr3.at(9)
p arr3[3,3]
p arr3[2..4]
p arr3[2...4]
arr3[1] = 8
p arr3
arr3[1,3] = [10,20,30]
p arr3
arr3[0..3] = [2,4,6,8]
p arr3
arr3[-1] = 12
p arr3
arr4 = [2, 4, 6, 8, 10]
arr4[1..2] = [3,3,3]
arr4[7] = 99
p arr4
arr5 = [1, 3, 5, 7, 9]
arr5[2] = [20, 30]
p arr5
arr6 = [0, 2, 4, 6, 8, 10, 12]
puts arr6.slice(2)
p arr6.slice(2,4)
p arr6.slice(2..4)
arr7 = %w[alpha beta gamma delta epsilon]
puts arr7.first
puts arr7.last
arr8 = [10, 20, 30, 40, 50, 60]
p arr8.values_at(0,1,4)
p arr8.values_at(0..2,5)
puts "8.1.3. Определение Размера Массива"
puts
arr9 = ["а", "b", "с", "d"]
puts arr9.length
puts arr9.size
arr10 = [1, 2, nil, nil, 3, 4]
puts arr10.size
puts arr10.length
#puts arr10.nitems нет метода, странно, может в новой версии переименовали
puts "8.1.4. Сравнение Массивов"

arr11 = [1, 2, 3, 9, 9]
arr12 = [1, 2, 4, 1, 1]

p arr11 <=> arr12

arr13 = [1, 2, 3]
arr14 = [1, 2, 3, 4]
arr15 = [1, 2, 3]

include Comparable
if arr13 < arr14
  puts "d меньше e"
else puts "false"
end

if arr13 == arr15
  puts "d равно f"
end
puts "8.1.5. Сортировка Массива"
puts words = %w(the quick brown fox)
p words.sort
p words.sort!

arr16 = [1, 2, "three", "four", 5, 6]
p arr16.sort {|x,y| x.to_s <=> y.to_s}

arr17 = [1, 4, 3, 5, 2]
p arr17.sort {|a,b| b <=> a}

arr18 = ["Starship Troopers", 
             "A Star is Born",
             "Star Wars",
             "Star 69",
             "The Starr Report"]
sorted = arr18.sort do |x,y|
  a = x.sub(/"(a |an |the )/i, "")
  b = y.sub(/"(a |an |the )/i, "")
  a.delete!(" .,-?!")
  b.delete!(" .,-?!")
  a.upcase!
  b.upcase!
  a <=> b
end
p sorted

puts "8.1.6. Выборка Из Массива По Заданному Критерию"
puts
include Enumerable
arr19 = [5, 8, 12, 9, 4, 30]
p arr19.detect {|e| e % 6 == 0}
p arr19.detect {|e| e % 7 == 0}
p arr19.find {|e| e % 2 == 0}
p arr19.find_all {|e| e % 2 == 0}
p arr19.select {|e| e % 2 == 0}

arr20 = %w[January February March April May]
p arr20.grep(/ary/)
arr21 = [1, 20, 5, 7, 13, 33, 15, 28]
p arr21.grep(12..24)

p arr20.grep(/ary/) {|m| m.length}
p arr21.grep(12..24) {|n| n*n}

arr22 = [5, 8, 12, 9, 4, 30]
p arr22.reject {|e| e % 2 == 0}
p arr21.reject! {|e| e % 3 == 0}

arr23 = %w[Elrond Galadriel Aragorn Saruman Legolas]
p arr23.min
p arr23.max
p arr23.min { |a, b| a.reverse <=> b.reverse }
p arr23.max { |a, b| a.reverse <=> b.reverse }

p arr23.index arr23.min
p arr23.index arr23.max

puts "8.1.7. Специализированные Функции Индексирования"
puts
class Array2 < Array
  def [](index)
    if index > 0
      super(index-1)
    else
      raise IndexError
    end
  end

  def [](index,obj)
    if index > 0
      super(index-1,obj)
    else
      raise IndexError
    end
  end
end

arr24 = Array2.new

p arr24[1]=5
p arr24[0]=1
p arr24[-1]=1

class TriMatrix
  def initialize
    @store = []
  end

  def [](x,y)
    if x > y
      index = (x*x+x)/2+y
      @store[index]
    else
      raise IndexError
    end
  end

  def []=(x,y,v)
    if x > y
      index = (x*x+x)/2+y
      @store[index] = v
    else
      raise IndexError
    end
  end
end

arr25 = TriMatrix.new

arr25[3,2] = 1
puts arr25[3,2]
#puts arr25[2,3]
puts "8.1.9. Массивы Как Математические Множества"
puts
arr26 = [1, 2, 3, 4, 5, 2, 3]
arr27 = [3, 4, 5, 6, 7]
p arr26 | arr27
p arr26 & arr27
p arr26 + arr27
p arr26 - arr27
p arr26 |= arr27
p arr26 &= arr27

if arr26.include? 3
  puts "y"
else
  puts "n"
end
puts "8.1.10. Рандомизация Массива"
puts
class Array

  def randomize
    self.sort_by { rand }
  end

  def randomize!
    self.replace(self.randomize)
  end
end

arr28 = [1, 2, 3, 4, 5]
p arr28.randomize
p arr28.randomize!

puts "8.1.11. Многомерные Массивы"
puts
class Array3

  def initialize
    @store = [[[]]]
  end

  def [](a,b,c)
    if @store[a]==nil ||
      @store[a][b]==nil ||
      @store[a][b][c]==nil
      return nil
    else
      return @store[a][b][c]
    end
  end

  def []=(a,b,c,x)
    @store[a] = [[]] if @store[a]==nil
    @store[a][b] = [] if @store[a][b]==nil
    @store[a][b][c] = x
  end
end

xx = Array3.new
xx[0,0,0] = 5
xx[0,0,1] = 6
xx[1,2,3] = 99
puts xx[1,2,3]
puts

puts "8.1.12. Нахождение Элементов, Принадлежащих Одному Массиву И Не Принадлежащих Другому"
text = %w[the magic words are squeamish ossifrage]
dect = %w[an are magic the them these words]
p text - dect
puts

puts "8.1.13. Преобразование Или Отображение Массивов"
arr29 = %w[alpha bravo charlie delta echo foxtrot]
p arr29.collect {|w| w[0..0]}
p arr29.collect {|w| w.length}
p arr29.map {|w| w.length}
p arr29.collect! {|w| w.upcase}
p arr29.map! {|w| w.reverse}
puts

puts "8.1.14. Удаление Из Массива Элементов Равных Nil"
arr30 = [1, 2, nil, 3, nil, 4, 5]
p arr30
p arr30.compact
p arr30.compact!
puts

puts "8.1.15. Удаление Заданных Элементов Из Массива"

arr31 = [10, 12, 14, 16, 18]

p arr31.delete_at(3)
p arr31
p arr31.delete_at(9)

arr32 = %w(spam spam bacon spam eggs ham spam)
p arr32.delete("spam")
p arr32

arr33 = ["alpha", "beta", "gamma", "delta"]
p arr33.delete("delta") {"Nonexistent"}
p arr33.delete("omega") {"Nonexistent"}

arr34 = ["job offers", "greetings", "spam", "news items"]
arr34.delete_if {|x| x.length==4}
p arr34

arr35 = [0, 2, 4, 6, 8, 10, 12, 14, 16]
p arr35.slice!(2)
p arr35
p arr35.slice!(2,3)
p arr35
p arr35.slice!(2..3)
p arr35

arr36 = [1, 2, 3, 4, 5]
p arr36.pop
p arr36.shift
p arr36

arr37 = [1,2,3,4,5,6,7,8]
p arr37.reject {|x| x%2==0}

p arr36.clear
puts

puts "8.1.16. Конкатенирование Массивов И Добавление В Конец Массива"

arr38 = [1, 5, 9]
p arr38 << 13
p arr38 << 17 << 21

arr39 = [1,2]
arr40 = [3,4]
arr41 = [5,6]
p arr40 + arr41
p arr40 + arr41 += arr39
p arr41.concat arr40
p arr40 << arr41
puts
puts "8.1.17. Использование Массива В Качестве Стека Или Очереди"
puts
puts "8.1.18. Обход Массива"

arr42 = %w(Son I am able she said)
str = ""
arr42.reverse_each { |w| str += "#{w} "}
puts str

arr43 = ["alpha", "beta", "gamma"]
arr43.each_with_index do |x,i|
  puts "Элемент #{i} равен #{x}"
end
puts
puts "8.1.19. Преобразование Массива В Строку С Разделителями"

arr44 = ["Veni", "vidi", "vici."]
p arr44.join(", ")

arr45 = ["Phi","Mu","Alpha"]
p arr45.join(" ")

arr46 = ["Bob","Carol","Ted","Alice"] 
p arr46 * " and "

puts
puts "8.1.20. Обращение Массива"

arr47 = ["red", "green", "blue"]
p arr47.reverse
p arr47.reverse!
puts
puts "8.1.21. Удаление Дубликатов Из Массива"

arr48 = %w[spam spam eggs ham eggs spam]
p arr48.uniq

puts 
puts "8.1.22. Чередование Массивов"

arr49 = [1, 2, 3, 4]
arr50 = ["a", "b", "c", "d"]
arr51 = arr49.zip(arr50)
p arr51.flatten

puts
puts "8.1.23. Вычисление Частоты Различных Значений В Массиве"

class Array
  def count
    k = Hash.new(0)
    self.each {|x| k[x] += 1}
    k
  end
end

arr52 = %w[spam spam eggs ham eggs spam]
p arr52.count
puts

puts "8.1.24. Инвертирование Массива Для Получения Хэша"

class Array
  def invert
    h = {}
    self.each_with_index{|x,i| h[x]=i}
    h
  end
end

arr53 = ["red","yellow","orange"]
p arr53.invert
puts

puts "8.1.25. Синхронная Сортировка Нескольких Массивов"
class Array
   def sort_index
    d = []
    self.each_with_index{|x,i| d[i]=[x,i]}
    if block_given?
      d.sort {|x,y| yield x[0], y[0]}.collect{|x| x[1]}
    else
      d.sort.collect{|x| x[1]}
    end
  end

  def sort_with(ord=[])
    return nil if self.length!=ord.length
    self.values_at(*ord)
  end
end

arr54 = [21, 33, 11, 34, 36, 24, 14]
arr55 = arr54.sort_index
arr542 = arr54.sort_with(arr55)
arr56 = arr54.sort_index {|x,y| x%2 <=> y%2}
arr543 = arr54.sort_with(arr56)

p arr54
p arr55
p arr542
p arr56
p arr543

puts
puts "Указание Значения По Умолчанию Для Новых Элементов Массива"

a1 = Array.new
a1[0]="x"
a1[3]="y"
p a1

class ZArray < Array

  def [](x)
    if x > size
      for i in size+1..x
        self[i]=0
      end
    end
    v = super(x)
  end

  def []=(x,v)
    max = size
    super(x,v)
    if size - max > 1
      (max..size-2).each do |i|
        self[i]=0
      end
    end
  end
end

num = ZArray.new
num[1] = 1
num[2] = 4
num[5] = 25
p num

puts
puts "8.2. Хэши"
p Hash.[]("flat",3,"curved",2)
p Hash.[]("flat"=>3,"curved"=>2)
#p Hash.["flat",3,"curved",2]
#p Hash.["flat"=>3,"curved"=>2]
#p {"flat",3,"curved",2}
#p {"flat"=>3,"curved"=>2}

hh1 = Hash.new
hh2 = Hash.new(99)
hh3 = Hash.new("a"=>3)
p hh2["angled"]
p hh2.inspect
p hh3["b"]

puts
puts "8.2.2. Указание Значения По Умолчанию Для Хэша"
hh4 = Hash.new("missing")
p hh4["hello"]
hh4.default="nothing"
p hh4["hello"]
p hh4["good"]<<"bye"
p hh4.default

#hh5 = {"flat",3,"curved",2,"angled",5}
#p hh5.fetch("pointed")
puts
puts "8.2.3. Доступ К Парам Ключ-Значение И Добавление Новых Пар"

hh5 = {}
p hh5["flat"]=3
p hh5.[]=("curved",2)
p hh5.store("angled",5)
p hh5

unless defined? hh5
  hh5={}
end
p hh5["flat"]

hh5 ||= {}
p hh5["flat"]

p (hh5 ||= {})["flat"]

hh6 = Hash.new(99)
p hh6[2]
p hh6
p hh6[2] ||= 5
p hh6
hh7 = Hash.new
p hh7
p hh7[2]
p hh7[2] ||= 5
p hh7
hh7 = {}
p hh7[2]
p hh7
p hh7[2].nil?
p hh7[3].nil?
p hh7
p hh7[nil]
p hh7[hh7[3]]

puts
puts "8.2.4. Удаление Пар Ключ-Значение"

hh8 = {1=>2, 3=>4}
p hh8.shift
p hh8

hh9 = {1=>1, 2=>4, 3=>9, 4=>16}
p hh9.delete(3)
p hh9
p hh9.delete(5)
p hh9.delete(6) {"not found"}

puts
puts "8.2.5. Обход Хэша"

{"а"=>3, "b"=>2}.each do |key, val|
print val, " из ", key, "; "
end

puts

{"а"=>3,"b"=>2}.each_key do |key|
  print "ключ = #{key};"
end

puts

{"a"=>3,"b"=>2}.each_value do |value|
  print "значение = #{value};"
end

puts
puts "8.2.6. Инвертирование Хэша"

hh10 = {"fred"=>"555-1122","jane"=>"555-7779"}
p hh10["jane"]
hh11 = hh10.invert
p hh11["555-7779"]

puts
puts "8.2.7. Поиск Ключей И Значений В Хэше"

hh12 = {"а"=>1,"b"=>2}
p hh12.has_key? "c"
p hh12.include? "а"
p hh12.key? 2
p hh12.member? "b"
p hh12.empty?
p hh12.length
p hh12.has_value? 2
p hh12.value? 99

puts
puts "8.2.8. Копирование Хэша В Массив"

hh13 = {"a"=>1,"b"=>2}
p hh13.to_a
p hh13.keys
p hh13.values

hh14 = {1=>"one", 2=>"two", 3=>"three", 4=>"four", "cinco"=>"five"}
p hh14.values_at(3,"cinco",4)
p hh14.values_at(1,3)

puts
puts "8.2.9. Выборка Пар Ключ-Значение По Заданному Критерию"

hh15 = {"fred"=>"jones","jane"=>"tucker", "joe"=>"tucker","mary"=>"SMITH"}
p hh15.detect {|k,v| v=="tucker"}
p hh15.find {|k,v| v==v.upcase}
p hh15.select {|k,v| v=="tucker"}
p hh15.find_all {|k,v| k.count("r")>0}

puts
puts "8.2.10. Сортировка Хэша"

hh16 = {"Jack"=>"Ruby","Monty"=>"Python",
            "Blaise"=>"Pascal", "Minnie"=>"Perl"}
p hh16.sort

puts
puts "8.2.11. Объединение Двух Хэшей"
hh17 = {"base"=>"foundation", "pedestal"=>"base"}
hh18 = {"base"=>"non-acid", "salt"=>"NaCl"}
p hh17.merge(hh18)
p hh17.merge(hh18) {|key,old,new| old < new ? old : new}

puts
puts "8.2.12. Создание Хэша Из Массива"
arr57 = [2,3,4,5,6,7]
p Hash[*arr57]

puts
puts "8.2.13. Вычисление Разности И Пересечения Хэшей"

hh18 = {"a"=>1,"b"=>2,"z"=>3}
hh19 = {"x"=>99,"y"=>88,"z"=>77}
p intersection = hh18.keys & hh19.keys
p difference = hh18.keys - hh19.keys
p c = hh18.dup.update(hh19)
inter = {}
intersection.each {|k| inter[k] = c[k]}
p inter
diff = {}
difference.each {|k| diff[k]=c[k] }
p diff

puts
puts "8.2.14. Хэш Как Разреженная Матрица"

hh20 = Hash.new(0)
hh20[1001] = 5
hh20[2010] = 7
hh20[9237] = 9
p hh20[9237]
p hh20[5050]

hh21 = Hash.new(0)
hh21[[2000,2000,2000]] = 2
p hh21[[36,24,36]]

puts
puts "8.2.15. Реализация Хэша С Повторяющимися Ключами"
  puts "Листинг 8.1. Хэш С Повторяющимися Ключами"

class HashDup
  def initialize(*all)
     raise IndexError if all.size % 2 != 0
     @store = {}
     if all[0] # не nil
      keyval = all.dup
      while !keyval.empty?
       key = keyval.shift
       if @store.has_key?(key)
        @store[key] += [keyval.shift]
       else
        @store[key] = [keyval.shift]
       end
      end
     end
    end
 
    def store(k,v)
     if @store.has_key?(k)
      @store[k] += [v]
     else
      @store[k] = [v]
     end
    end
 
    def [](key)
     @store[key]
    end
 
    def []=(key,value)
     self.store(key,value)
    end
 
    def to_s
     @store.to_s
    end
 
    def to_a
     @store.to_a
    end
 
    def inspect
     @store.inspect
    end
 
    def keys
     result=[]
     @store.each do |k,v|
      result += ([k]*v.size)
     end
     result
    end
 
    def values
     @store.values.flatten
    end
 
    def each
     @store.each {|k,v| v.each {|y| yield k,y}}
    end
 
    alias each_pair each
 
    def each_key
     self.keys.each {|k| yield k}
    end
 
    def each_value
     self.values.each {|v| yield v}
    end
 
    def has_key? k
     self.keys.include? k
    end
 
    def has_value? v
     self.values.include? v
    end
 
    def length
     self.values.size
    end
 
    alias size length
 
    def delete k
     val = @store[k]
     @store.delete k
     val
    end
 
    def delete k,v
     @store[k] -= [v] if @store[k]
     v
    end

end

hh22 = {1=>1, 2=>4, 3=>9, 4=>16, 2=>0}

hh23 = HashDup.new(1,1, 2,4, 3,9, 4,16, 2,0)
p hh23.keys
p hh23.values
p hh23.size

hh23.each {|k,v| puts "#{k} => #{v}"}

puts
puts "8.3. Перечисляемые Структуры В Общем"

puts
puts "8.3.1. Метод Inject"

arr58 = [3,5,7,9,11,13]
p arr58.inject(0) {|x,n| x+n}
#sum = 0
#puts arr58.each {|n| sum += n}
p arr58.inject(1) {|x,n| x*n}

arr59 = %w[ alpha beta gamma delta epsilon eta theta ]
longest_word = arr59.inject do |best,w|
  w.length > best.length ? w : best
end
p longest_word

puts
puts "8.3.2. Кванторы"
arr60 = [1,3,5,8,9]
p arr60.any? {|x| x % 2 == 0}
p arr60.all? {|x| x % 2 == 0}
p arr60.all?
p arr60.any?

puts
puts "8.3.3. Метод Partition"
arr61 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

p arr61.partition {|x| x % 2 == 1}
p arr61.partition {|x| x > 5}
p arr61.partition {|x| Math.sqrt(x).to_i**2 == x}

   module Enumerable
    def classify(&block)
     hash = {}
     self.each do |x|
      result = block.call(x)
      (hash[result] ||= []) << x
     end
     hash
    end
   end

arr62 = [1,2,3,4,5,6,7,8,9]
p arr62.classify {|x| x % 3}

puts
puts "8.3.4. Обход С Группировкой"
require 'enumerator'

arr63 = [1,2,3,4,5,6,7,8,9,10]

arr63.each_slice(3) do |triple|
  puts triple.join(",")
end

arr64 = [1,2,3,4,5,6,7,8,9,10]
arr64.each_cons(3) do |triple|
  puts triple.join(",")
end

puts
puts "8.3.5. Преобразование В Массив Или Множество"

hh24 = {1=>2, 3=>4, 5=>6}
p hh24.to_a

require "set"

p hh24.to_set

puts
puts "8.3.6. Энумераторы"

 require 'enumerator'

class Foo
  def every
    yield 3
    yield 2
    yield 1
    yield 4
  end
end

foo = Foo.new
#enum = Enumerable::Enumerator.new(foo,:every)
#p enum.each {|x| p x}

puts
puts "8.3.7. Объекты-Генераторы"
#require 'generator' - нет библиотеки
#arr65 = [7,8,9,10,11,12]
#gen = Generator.new(arr65)
#p gen.current
#p gen.index



