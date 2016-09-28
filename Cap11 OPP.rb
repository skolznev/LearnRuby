puts 
puts "Глава 11. ООП И Динамические Механизмы В Ruby"

puts
puts "11.1. Рутинные Объектно-Ориентированные Задачи"

puts
puts "11.1.1. Применение Нескольких Конструкторов"

puts "Листинг 11.1. Несколько Конструкторов"

class ColoredRectangle

  def initialize(r,g,b,s1,s2)
    @r,@g,@b,@s1,@s2=r,g,b,s1,s2
  end

  def ColoredRectangle.white_rect(s1,s2)
    new(0xff,0xff,0xff,s1,s2)
  end

  def ColoredRectangle.colored_square(r,g,b,s)
    new(r,g,b,s,s)
  end

  def ColoredRectangle.red_square(s)
    new(0xff,0,0,s,s)
  end

  def inspect
    "#@r #@g #@b #@s1 #@s2"
  end

end

p ColoredRectangle.new(0x88,0xaa,0xff,20,30)
p ColoredRectangle.white_rect(15,25)
p ColoredRectangle.red_square(40)

puts
puts "11.1.2. Создание Атрибутов Экземпляра"

puts
puts "11.1.3. Более Сложные Конструкторы"

class PersonalComputer
  attr_accessor :manufacturer,
    :model, :processor, :clock,
    :ram, :disk, :monitor,
    :colors, :vres, :hres, :net

    def initialize(&block)
      instance_eval &block
    end

  end

  desktop = PersonalComputer.new do
    self.manufacturer = "Acme"
    self.model = "THX-1138"
    self.processor = "986"
    self.clock = 9.6
    self.ram = 16
    self.disk = 20
    self.monitor = 25
    self.colors = 16777216
    self.vres = 1280
    self.hres = 1600
    self.net = "T3"
  end

  p desktop

  puts
  puts "11.1.4. Создание Атрибутов И Методов Уровня Класса"
  puts "Листинг 11.3. Переменные И Методы Класса"

  class Metal
    @@current_temp = 70

    attr_accessor :atomic_number

    def Metal.current_temp=(x)
      @@current_temp = x
    end

    def Metal.current_temp
      @@current_temp
    end

    def liquid?
      @@current_temp >= @melting
    end

    def initialize(atnum, melt)
      @atomic_number = atnum
      @melting = melt
    end
  end

  puts
  aluminum = Metal.new(13, 1236)
  copper = Metal.new(29, 1982)
  gold = Metal.new(79,1948)

  Metal.current_temp = 1600

  puts aluminum.liquid?
  puts copper.liquid?
  puts gold.liquid?

  Metal.current_temp = 2100
  puts
  puts aluminum.liquid?
  puts copper.liquid?
  puts gold.liquid?

puts
puts "Листинг 11.4. Данные Класса И Экземпляра"

class MyClass

  SOME_CONST = "alpha" # Константа уровня класса

  @@var = "beta" # Переменная класса
  @var = "gamma" # Переменная экземпляра класса

  def initialize
    @var = "delta" # Переменная экземпляра
  end

  def mymethod
    puts SOME_CONST
    puts @@var
    puts @var
  end

  def MyClass.classmeth1
    puts SOME_CONST
    puts @@var
    puts @var
  end
end

def MyClass.classmeth2
  puts MyClass::SOME_CONST
  # puts @@var
  puts @var
end

myobj = MyClass.new
MyClass.classmeth1
MyClass.classmeth2
myobj.mymethod

puts
puts "11.1.5. Наследование Суперклассу"

class Person
  attr_accessor :name, :age, :sex

  def initialize(name, age, sex)
    @name, @age, @sex = name, age, sex
  end
end

class Student < Person
  attr_accessor :idnum, :hours

  def initialize(name, age, sex, idnum, hours)
    super(name, age, sex)
    @idnum = idnum
    @hours = hours
  end
end

p a = Person.new("Dave Bowman", 37, "m")
p b = Student.new("Franklin Poole", 36, "m", "000-13", 24)

puts
puts "11.1.6. Опрос Класса Объекта"

s = "Hello"
n = 237

p s.class
p n.class

puts (5.instance_of? Fixnum)
puts ("XYZZT".instance_of? Fixnum)
puts ("KJGFS".instance_of? String)

n = 9876543210
puts n.instance_of? Bignum
puts n.kind_of? Bignum
puts n.is_a? Bignum
puts n.is_a? Integer
puts n.is_a? Numeric
puts n.is_a? Object
puts n.is_a? String
puts n.is_a? Array
puts
x = [1, 2, 3]
puts x.kind_of? Enumerable
puts x.is_a? Enumerable
puts
puts Integer < Numeric
puts Integer < Object
puts Object == Array
puts IO >= File
p Float < Integer
puts
p Array.superclass
p 237.class.superclass
p Object.superclass

puts
puts "11.1.7. Проверка Объектов На Равенство"

puts
puts "11.1.8. Управление Доступом К Методам"
puts "Листинг 11.5. Закрытые Методы"

class Bank
  def open_safe
    #
  end

  def close_safe
    #
  end

  private :open_safe, :close_safe

  def make_withdrawal(amount)
    if access_allowed
      open_safe
      get_cash(amount)
      close_safe
    end
  end

  #

  private

  def get_cash
    #
  end

  def access_allowed
    #
  end
end

class Person

  def initialize(name, age)
    @name, @age = name, age
  end

  def <=> (other)
    age <=> other.age
  end

  attr_reader :name, :age
  protected :age
end

p1 = Person.new("freed", 31)
p2 = Person.new("agnes", 43)
p compare = (p1 <=> p2)
#p p1.age 

puts
puts "11.1.9. Копирование Объектов"

s1 = "cat"

def s1.upcase
  "CaT"
end

s1_dup = s1.dup
s1_clone = s1.clone
p s1
p s1_dup.upcase
p s1_clone.upcase

arr1 = [1, "flipper", 3]
arr2 = arr1.dup

arr2[2] = 99
arr2[1][2] = 'a'

p arr1
p arr2

arr1 = [1, "flipper", 3]
arr2 = Marshal.load(Marshal.dump(arr1))

arr2[2] = 99
arr2[1][2] = 'a'

p arr1
p arr2

puts
puts "11.1.10. Метод Initialize_copy"

#class Document
#  attr_accessor :title, :text
#  attr_reader :timestamp

#  def initialize(title, text)
#    @title, @text = title, text
#    @timestamp = Time.now
#  end
#end

#doc1 = Document.new("Random Stuff",File.read("D:/rb/2.rb"))
#sleep 5
#doc2 = doc1.clone

#doc1.timestamp == doc2.timestamp

puts
puts "11.1.11. Метод Allocate"

class Person
  attr_accessor :name, :age, :phone

  def initialize(n,a,p)
    @name, @age, @phone = n,a,p
  end
end

p1 = Person.new("John Smith",29,"555-1234")
p2 = Person.allocate

p p1.age
p p2.age

puts
puts "11.1.12. Модули"

module MyMod
  def meth1
    puts "It is method 1"
  end
end

class MyClass
  include MyMod
end

x = MyClass.new
p x.meth1
puts
puts "Листинг 11.6. Включение Модуля С Переопределенным Методом Append_features"

module MyMod

  def MyMod.append_features(someClass)
    def someClass.modmeth
      puts "Method modul (klass)"
    end
    super
  end

  def meth1
    puts "Method 1"
  end
end

class MyClass

  include MyMod

  def MyClass.classmeth
    puts "Class method"
  end

  def meth2
    puts "Method 2"
  end
end

x = MyClass.new

p MyClass.classmeth
p x.meth1
p MyClass.modmeth
p x.meth2

puts
puts "Листинг 11.7. Методы Экземпляра Модуля Становятся Методами Класса"

module MyMod

  def meth3
    puts "Метод экземпляра модуля meth3"
    puts "может стать методом класса"
  end
end

class MyClass

  class << self
    include MyMod
  end
end

p MyClass.meth3

puts
puts "11.1.13. Трансформация Или Преобразование Объектов"

class Pet

  def initialize(name)
    @name = name
  end

  def to_s
    "Pet: #@name"
  end
end

class Numeric

  def to_str
    to_s
  end
end

label = "Number "+9
p label.to_str

class String

  def to_ary
    return self.split("")
  end
end

str = "UFO"

a,b,c = str
p str.to_ary

puts
puts "11.1.14. Классы, Содержащие Только Данные (Struct)"

Address = Struct.new("Address", :street, :city, :state)
p books = Address.new("411 Elm St", "Dallas", "TX")

puts
puts "11.1.15. Замораживание Объектов"
puts "Листинг 11.8. Замораживание Объекта"

str = "It's text."
str.freeze

begin
  str << " Don't worry"
rescue => err
  puts "#{err.class} #{err}"
end

arr = [1, 2, 3]
arr.freeze

begin
  arr << 4
rescue => err
  puts "#{err.class} #{err}"
end

str = "counter-"
str.freeze
p str += "intuitive"

arr = [8,6,7]
arr.freeze
p arr += [5,3,0,9]

hash = {1 => 1, 2 => 4, 3 => 9}
hash.freeze
arr = hash.to_a
puts hash.frozen?
puts arr.frozen?
hash2 = hash
puts hash2.frozen?

puts
puts "11.2. Более Сложные Механизмы"
puts "11.2.1. Отправка Объекту Явного Сообщения"
puts "Листинг 11.9. Сортировка По Любому Ключу"

class Person
  attr_reader :name, :age, :height

  def initialize(name, age, height)
    @name, @age, @height = name, age, height
  end

  def inspect
    "#{@name} #{@age} #{@height}"
  end
end

class Array
  def sort_by(sym)
    self.sort {|x,y| x.send(sym) <=> y.send(sym)}
  end
end

people = []
people << Person.new("Hansel", 35, 69)
people << Person.new("Gretel", 32, 64)
people << Person.new("Ted", 36, 68)
people << Person.new("Alice", 33, 63)

p1 = people.sort_by(:name)
p2 = people.sort_by(:age)
p3 = people.sort_by(:height)

p p1
p p2
p p3

puts
puts "11.2.2. Специализация Отдельного Объекта"

a = "hello"
b = "goodby"

def b.upcase
  gsub(/(.)(.)/) {$1.upcase + $2}
end

puts a.upcase
puts b.upcase

b = "goodby"

class << b

  def upcase
  gsub(/(.)(.)/) {$1.upcase + $2}
  end
end
puts
puts b.upcase
puts b
b.upcase!
puts b
puts "Листинг 11.10. Метод Уровня Класса Accessor_string"


class MyClass
 
    class << self
 
     def accessor_string(*names)
      names.each do |name|
       class_eval <<-EOF
       def #{name}
        @#{name}.to_s
       end
       EOF
      end
     end
 
    end

    def initialize
      @a = [1,2,3]
      @b = Time.now
    end

    accessor_string :a, :b
  end

  o = MyClass.new
  puts o.a
  puts o.b

  puts
  puts "11.2.3. Вложенные Классы И Модули"

  puts
  puts "11.2.4. Создание Параметрических Классов"

  puts "Листинг 11.13. Параметрические Классы: Улучшенное Решение"

  class IntelligentLife

    def IntelligentLife.home_planet
      class_eval("@@home_planet")
    end

    def IntelligentLife.home_planet=(x)
      class_eval("@@home_planet = #{x}")
    end
  end

  class Terran < IntelligentLife
    @@home_planet = "Earth"
  end

  class Martian < IntelligentLife
    @@home_planet = "Mars"
  end

  puts Terran.home_planet
  puts Martian.home_planet

  puts
  puts "Листинг 11.14. Параметрические Классы: Самое Лучшее Решение"

  class IntelligentLife
    class << self
      attr_accessor :home_planet
    end
  end

  class Terran < IntelligentLife
    self.home_planet = "Earth"
  end

  class Martian < IntelligentLife
    self.home_planet = "Mars"
  end

  puts Terran.home_planet
  puts Martian.home_planet  


  puts
  puts "11.2.5. Использование Продолжений Для Реализации Генератора"
  puts "Листинг 11.15. Генератор Чисел Фибоначчи"

#class Generator
 
#    def initialize
#     do_generation
#    end
 
#    def next
#     callcc do |here|
#      @main_context = here;
#      @generator_context.call
#     end
#    end
 
#    private
 
#    def do_generation
#     callcc do |context|
#      @generator_context = context;
#      return
##     end
#     generating_loop
#    end
#    def generate(value)
#     callcc do |context|
#      @generator_context = context;
#      @main_context.call(value)
#     end
#    end
#   end
 
   # Порождаем подкласс и определяем метод generating_loop.
 
#   class FibGenerator < Generator
#    def generating_loop
#     generate(1)
#     a, b = 1, 1
#     loop do
##      generate(b)
#      a, b = b, a+b
#     end
#    end
#   end

#  fib = FibGenerator.new

#  p fib.next

puts
puts "11.2.6. Хранение Кода В Виде Объекта"

myproc = Proc.new {|a| puts "Параметр равен #{a}"}

myproc.call(99)

def take_block(x, &block)
  puts block.class
  x.times {|i| block[i, i*i]}
end

take_block(3) {|n,s| puts "#{n} в квадрате равно #{s}"}

myproc = proc {|n| print n, "..."}
(1..3).each(&myproc)
puts
str = "cat"
meth = str.method(:length)
a = meth.call
str << "erpillar"
b = meth.call
p a
p b

str = "dog"

c = meth.call
p c
puts
umeth = String.instance_method(:length)
m1 = umeth.bind("cat")
p m1.call
m2 = umeth.bind("caterpillar")
p m2.call

puts
puts "11.2.7. Как Работает Включение Модулей?"

module MyMod
  def meth
    "from module"
  end
end

class ParentClass
  def meth
    "from parent"
  end
end

class ChildClass < ParentClass
  include MyMod
  def meth
    "from child"
  end
end

x = ChildClass.new
p x.meth

class ChildClass < ParentClass
  include MyMod
  def meth
    "from child: super = " + super
  end
end

x = ChildClass.new
p x.meth

module MyMod
  def meth
    "from module: super = " + super
  end
end
class ChildClass < ParentClass
  include MyMod
  def meth
    "from child: super = " + super
  end
end

x = ChildClass.new
p x.meth

#module MyMod
#  def meth
#    "from module: super = " + super
#  end
#end

#class Foo 
#  include MyMod
#end

#  x = Foo.new
#  p x.meth

puts
puts "11.2.8. Опознание Параметров, Заданных По Умолчанию"

def meth(a,b=(flag=true; 345))
  puts "b равно #{b}, а flag равен #{flag.inspect}"
end

puts meth(123)
puts meth(123,345)
puts meth(123,456)

puts
puts "11.2.9. Делегирование Или Перенаправление"

require 'delegate'

class MyQueue < DelegateClass(Array)

  def initialize(arg=[])
    super(arg)
  end

  alias_method :enqueue, :push
  alias_method :dequeue, :shift
end

mq = MyQueue.new

mq.enqueue(123)
mq.enqueue(234)

p mq.dequeue
p mq.dequeue

puts
puts "11.2.10. Автоматическое Определение Методов Чтения И Установки На Уровне Класса"

class MyClass

  @alpha = 123

  class << self
    attr_reader :alpha
    attr_writer :beta
    attr_accessor :gamma
  end

  def MyClass.look
    puts "#@alpha, #@beta, #@gamma"
  end
end

puts MyClass.alpha
MyClass.beta = 456
MyClass.gamma = 789
puts MyClass.gamma

puts MyClass.look

puts
puts "11.2.11. Поддержка Различных Стилей Программирования"

puts
puts "11.3. Динамические Механизмы"

#param = {}
#ARGF.each do |line|
#  name, expr = line.split(/\s*=\s*/,2)
#end

#a = 1
#b = 2+3
#c = 'date'

puts
puts "11.3.2. Метод Const_get"

str = "PI"
puts Math.const_get(str)

puts
puts "11.3.3. Динамическое Создание Экземпляра Класса, Заданного Своим Именем"

classname = "Array"

klass = Object.const_get(classname)
p x = klass.new(4,1)

class Alpha
  class Beta
    class Gamma
      FOOBAR = 237
    end
  end
end

str = "Alpha::Beta::Gamma::FOOBAR"
p val = Object.const_get(str)

puts
puts "11.3.4. Получение И Установка Переменных Экземпляра"

class MyClass
  attr_reader :alpha, :beta

  def initialize(a,b,g)
    @alpha, @beta, @gamma = a, b, g
  end
end

x = MyClass.new(10,11,12)
x.instance_variable_set("@alpha", 234)
p x.alpha

puts
puts "11.3.5. Метод Define_method"

puts
puts "11.3.6. Метод Const_missing"

class Module
  def const_missing(x)
    "From Module"
  end
end

class X
  end

  p X::BAR
  p BAR
  p Array::BAR

puts
puts "11.3.7. Удаление Определений"

def asbestos
  puts "Теперь не огнеопасно"
end

tax = 0.08

PI = 3

asbestos
puts "PI=#{PI}, tax=#{tax}"

undef asbestos
#undef tax
#undef PI

puts
puts "Листинг 11.16. Методы Remove_method И Undef_method"

class Parent

  def alpha
    puts "alpha: parent"
  end

  def beta
    puts "beta: parent"
  end
end

class Child < Parent

  def alpha
    puts "alpha: child"
  end

  def beta
    puts "beta: child"
  end

  remove_method :alpha
  #undef_method :beta
end

x = Child.new

p x.alpha
p x.beta

puts
puts "11.3.8. Получение Списка Определенных Сущностей"

p Array.ancestors
p Math.constants

class Parent
  @@var1 = nil
end

class Child < Parent
  @@var2 = nil
end

p Parent.class_variables
p Child.class_variables
p Array.included_modules


p Array.instance_methods.size
puts "Листинг 11.17. Отражение И Переменные Экземпляра"

class SomeClass

  def initialize
    @a = 1
    @b = 2
  end

  def mymeth
    #...
  end

  protected :mymeth
end

x = SomeClass.new

def 
  x.newmeth
  #...
end

p iv = x.instance_variables
p x.methods.size

p x.public_methods.size
p x.public_methods(false).size

p x.private_methods.size
p x.private_methods(false).size

p x.protected_methods.size
p x.singleton_methods.size

puts
puts "11.3.9. Просмотр Стека Вызовов"

def func1
  puts caller[0]
end

def func2
  func1
end

p func2

puts
puts "11.3.10. Мониторинг Выполнения Программы"

def meth(n)
  sum = 0
  for i in 1..n
    sum += 1
  end
  sum
end

#set_trace_func(proc do |event, file, line, id, binding, klass, *rest|
#  printf "%8s %s:%d %s/%s\n", event, file, line, klass, id
#end)

meth(2)

def meth(n)
  (1..n).each {|i| puts i}
end

meth(3)

puts
puts "11.3.11. Обход Пространства Объектов"

puts
puts "11.3.12. Обработка Вызовов Несуществующих Методов"

   #class CommandWrapper
 
   # def method_missing(method, *args)
   #  system (method.to_s, *args)
   # end
 
   #end
 
   #cw = CommandWrapper.new
   #cw.date

puts
puts "11.3.13. Отслеживание Изменений В Определении Класса Или Объекта"

puts
puts "11.3.14. Определение Чистильщиков Для Объектов"








