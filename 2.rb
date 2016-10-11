
p %<<book><title>Ruby</title><book>>
p %q_\_example\__

doc = <<HERE
This is string literal
HERE
p doc

10.times { puts "test".object_id }

p %q{page_78 '3.2.2'}

greeting = "Hello"
greeting << " " << "World!"
p greeting

p greeting.encoding

p %Q<page_88, 3.2.6.2>

words = %w[this is a test]
p words[2]
words[2] = "zero"
words.each {|x| p x}

p %Q(page_95, 3.5 "Диапазоны")

a = 1...10
c = a.each {|x| p x}
p a.include? 15
puts
p c.respond_to? :each

p %q[page_100, 3.8]

p a.object_id

p a.class == Range

puts %Q(page_107, "Object Order")

p (1...3) === 3
p 1 <=> 5
p 1 <=> 1
p 9 <=> 1
p "qqq" <=> 5
p 1 != 5

b = 1.between?(0,10)
p b.class

p b

a = 1...5

p a.to_a

s = "test string"
s << " end freeze"
p s
s.freeze
p s.frozen?
#s << " ...mmm?"
p s

s = "WARNING!"
s.taint
p s.tainted?
p s.downcase.tainted?

puts %Q["_page115_']

puts %q<page-123, 'Присваивание'>

x, = 1,2,3
p x
puts
v,(y,(z,w)) = [1,[2,[3,4]]]
p v,y,z,w

puts %Q/Page-139 "Равенство"/

p 2 != 3
p 2 =~ 3
a = "hi world"
b = "hi World"
p a === b

x = nil
x && p(x.to_s)


puts %Q.Page-143'4-6-9'.

(0+1...5+5).each {|x| p x if x==3..x==5}

n = 2
p "You have #{n} #{n==1 ? 'massage' : 'massages'}"

puts "Page-152 \"Глава5\""

x = 6
if x <10 then x += 1 end
p x
t = 0
puts x if z and x and t

unless x < 10 then x += 1 end
p x

case x
when 6
	p "six"	
when 7 then	p "seven"
when 8;	p "eight"
else 
	p "else"	
end
puts 'Page 162 Глава 5/1/5'

x = 2

x == 1 ? (p "one") : (p "nothing")

x = 10
while x >= 0 do #true
	puts x
	x -= 1	
end

x = 0
until x > 10 do #false
	puts x
	x += 1	
end

x = 0
puts x += 1 while x < 10

x = 0
puts x += 1 until x >= 10

puts " Page 165, 5.2.3"

arr = [1,2,3,4,5,6,7]

for x in arr
	p x
end

7.times {|x| p x}

0.step(Math::PI, 0.1) {|x| puts Math.sin(x)}

p %q[page172, 5\3\4]

a = "hello"

p a.chars.map {|x| x}

iter = 9.downto(1)
begin
 print iter.next while true
rescue StopIteration
	puts "...babakh!!"
end

iter = 9.downto(1)
loop do
	StopIteration
	print iter.next

end
puts "....babakh!!!"

p %Q{Page_178_Part_"5/4"}

x = y = 0

1.upto(4) do |x;y|
	y = x + 1
	p y*y
end
p [x,y]

puts "Page 186, part 'Break' "

i = 0

while(i<3)
	p i
	i += 1
	redo if i == 3
end
p %q/Page 194 \|\ Part 5.6/

def fac(n)

	raise "неверный аргумент #{n}" if n < 1
	return 1 if n == 1
	n * fac(n-1)

end
p fac(1)

puts

begin
	x = factorial(-1)

rescue => ex 
	puts "#{ex.class}: #{ex.message}"
end

puts "Page 200, Part 5632"

x = -1
y = factorial(x) rescue 0
p y

p %Q_Page-206 Part-5.7_

f = Fiber.new {
	puts "Вас приветствует нить"
	Fiber.yield #yielding - передача
	puts "Нить с вами прощается"
}
puts "Вас приветствует вызывающая программа"
f.resume
puts "Вызываюая программа с вами прошается"
f.resume

puts

f = Fiber.new do |message|
	puts "Вызываюая программа сказала: #{message}"
	message2 = Fiber.yield("Привет")

	puts "Вызываюая программа сказала: #{message2}"
	"Отлично"
end

response = f.resume("Привет")
puts "Нить сказала: #{response}"
response2 = f.resume("Как делап?")
puts "Нить сказала: #{response2}"

p %q(Page - 212, Part 5822)

def fibonacci_generator(x0, y0)
	Fiber.new do
		x,y = x0, y0
		loop do
			Fiber.yield y
			x,y = y, x+y
		end
	end
end

g = fibonacci_generator(0,1)
10.times { print g.resume, " "}

class FibonacciGenerator
	def initialize
		@x, @y = 0,1
		@fiber = Fiber.new do
			loop do
				@x, @y = @y, @x+@y
				Fiber.yield @x
			end
		end
	end

	def next
		@fiber.resume
	end

	def rewind
		@x, @y = 0,1
	end
end
puts
g = FibonacciGenerator.new
10.times {print g.next, " "}
g.rewind; puts
10.times {print g.next, " "}
puts
puts
require 'fiber'

f = g = nil
f = Fiber.new { |x|
	puts "f1: #{x}"
	x = g.transfer(x+1)
	puts "f2: #{x}"
	x = g.transfer(x+1)
	puts "f3: #{x}"
	x + 1
}

g = Fiber.new { |x| 
	puts "g1: #{x}"
	x = f.transfer(x+1)
	puts "g2: #{x}"
	x = f.transfer(x+1)
}
puts f.transfer(1)


o = "massage"
def o.printme
	puts self
end

o.printme

puts

p %q(\Page 222 __ Part 615|)

def tt(x)
	puts x
end

tt(10)

alias s_s tt

s_s(10)

puts
puts "Page 228, Part 64"

def prefix(s, len=1)
	s[0,len]
end

p prefix("Ruby", 3)
p prefix("Ruby")

puts

def suffix(s, index=s.size-1)
	s[index, s.size-1]
end

p suffix("Ruby",3)
p suffix("Ruby",2)
p suffix("Ruby",1)
p suffix("Ruby")

def append(x, a=[], aa=[x,x])
	a << x
	aa << x
end

puts

p append(5)
p append(4)

puts

def max(first, *rest)
	max = first
	rest.each {|x| max = x if x > max}
	max
end

p max(1)
p max(1,2)
p max(1,2,3)
p max(5,2)

puts

data = [3,2,1]
p max(*data)
p max(data)
p max(*"hello worldz".each_char)

puts "Page - 232, Caption - 643"

def sequence(args)
n = args[:n] || 0
m = args[:m] || 1
c = args[:c] || 0
a = []
n.times {|i| a << m*i+c}
a
end

p sequence({:n=>3, :m=>5})
p sequence c:1, m:3, n:5
p %Q[Page-233, Caption - 645]

def sequence2(n,m,c)
	i = 0
	while(i<n)
		yield i*m+c
		i += 1
	end
end

sequence2(5,2,2) {|x| puts x}

def sequence5(args, &b)
	n,m,c = args[:n],args[:m],args[:c]
	i = 0
	while(i<n)
		b.call(i*m+c)
		i += 1
	end
end
puts
a, b = [1,2,3], [4,5]

summation = Proc.new {|total, x| total+x}
p sum = a.inject(0, &summation)
p sum = b.inject(sum, &summation)

puts 'Page 237, Part 65'

def makeproc(&p)
	p
end

adder = makeproc {|x,y| x+y}

p sum = adder.call(2,2)

succ = ->(x){x+1}
p succ.call(2)

zoom = ->x,y,factor=2 {[x*factor, y*factor]}
p zoom.call(2,3)

puts "Page240, Part652"

p lambda{|x| x*x} == lambda{|x| x*x}

p = lambda{|x| x*x}
q = p.dup
p p == q


def test
	puts "вход в метод"
	1.times {puts "вход в блок"; return}
	puts "выход из метода"
end
test

puts

def test
	puts "вход в метод"
	p = Proc.new {puts "вход в proc"; return}
	p.call
	puts "выход из метода"
end
test

puts

def procBuilder(message)
	Proc.new{puts message; return}
end

def test
	puts "enter in method"
	p = procBuilder("enter in proc")
	p.call rescue puts "ATTENTION! error proc"
	puts "exit from method"
end
test

puts

def test
	puts "enter in method"
	p = lambda{puts "enter in lambda"; return}
	p.call

	puts "exit from method"
end
test

puts

def lambdaBuilder(message)
	lambda{puts message; return}
end

def test
	puts "enter in method"
	l = lambdaBuilder("enter in lambda")
	l.call
	puts "exit from method"
end
test

puts "Page244, Part6552"
puts

def test
	puts "enter in method test"
	proc = Proc.new {puts "enter in proc"; break}
	proc.call rescue puts "ATTENTION! error break in proc"
	puts "exit from method test"
end
test

puts

def iterator(&proc)
	puts "enter in iter"
	proc.call
	puts "exit from iter"
end

def test
	iterator {puts "enter in proc"; break}
end
test

puts

def test
	puts "enter in method test"
	lambda = lambda {puts "enter in lambda"; break; puts "exit from lambda"}
	lambda.call
	puts "exit from method test"
end
test

puts

p = Proc.new{|x,y| print x,y}
p.call(1)
puts
p.call(1,2)
puts
p.call(1,2,3)
puts
p.call([1,2])

puts
puts

l = lambda{|x,y| print x,y}
l.call(1,2)
l.call(1) rescue puts " ERROR! невернок количество аргументов"

puts "Page 247"

def multi(data, n)
	data.collect{|x| x*n}
end
puts multi([1,2,3],2)

puts

def multi(n)
	lambda{|data| data.collect{|x| x*n}}
end

doubler = multi(2)

puts doubler.call([1,2,3])

puts

def accessor_pair(initialValue=nil)
	value = initialValue

	getter = lambda{value}
	setter = lambda{|x| value = x}
	return getter, setter
end

getX, setX = accessor_pair(0)

puts getX[]

setX[10]

puts getX[]

puts

def multi(*args)
	x=nil
	args.map {|x| lambda {|y| x*y}}
end

double, triple = multi(2,3)
puts double.call(2)

puts

def multi(n)
	lambda{|data| data.collect{|x| x*n}}
end

doubler = multi(2)

puts doubler.call([1,2,3])

eval("n=3", doubler.binding)
puts doubler.call([1,2,3])

puts
puts %Q'''page250, part67'''

p m = 0.method(:succ)
p m.call

puts

def square(x); x*x; end
puts (1..10).map(&method(:square))

puts

p unbound_plus = Fixnum.instance_method("+")
p plus_2 = unbound_plus.bind(2)
p sum = plus_2.call(2)
p plus_3 = plus_2.unbind.bind(3)

puts

class Point
end
pi = Point.new
p pi.class
p pi.is_a? Point

puts %Q/page264__part713/

class Point
	def initialize(x,y)
		@x, @y = x, y
	end

	def to_s
		"(#{@x},#{@y})"
	end
end

p = Point.new(1,2)
puts p

class Point
	def initialize(x,y)
		@x, @y = x, y
	end

	def x
		@x
	end

	def y
		@y
	end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)

puts q

class MutablePoint
	def initialize(x,y); @x, @y = x, y; end

	def x; @x; end
	def y; @y; end

	def x=(value)
		@x = value
	end

	def y=(value)
		@y = value
	end
end

p = Point.new(1,1)
puts p
#p.x = 0
#p.y = 0

puts 'Page268_Part716'

class Point
	attr_reader :x, :y

	def initialize(x,y)
		@x, @y = x, y
	end

	def +(other)
		Point.new(@x + other.x, @y + other.y)
	end

	def -@
		Point.new(-@x, -@y)
	end

	def *(scalar)
		Point.new(@x*scalar, @y*scalar)
	end

	def each
		yield @x
		yield @y
	end
end


p p = Point.new(1,2)

p.each{|x| print x}

puts "Page272_Part719"

def <=>(other)
	return nil unless other.instance_of? Point
	@x**2 + @y**2 <=> other.x**2 + other.y**2
end

Struct.new("Point", :x, :y)
#Point = Struct.new(:x, :y)

puts

class Point
	def initialize(x,y)
		@x, @y = x, y
	end

	ORIGIN = Point.new(0,0)
	UNIT_X = Point.new(1,0)
	UNIT_Y = Point.new(0,1)
end

p Point::UNIT_X + Point::UNIT_Y
Point::PUTS_STOP = "Page280_Part7115"
Point::PUTS_STOP2 = "Page288_Part732"

p Point::PUTS_STOP
p Point::PUTS_STOP2

class HelloW
	def greet
		puts "#{greeting} #{who}"
	end

	def greeting
		"Hello"
	end

	def who
		"World"
	end
end

class SpanHelloW < HelloW
	def greeting
		"Hola"
	end
end

HelloW.new.greet
SpanHelloW.new.greet

class A
	@@val = 1
	def A.value; @@val; end
end
print A.value

class B < A; @@val = 2; end
print A.value

class C < A; @@val = 3; end
print A.value

puts %Q^Page_294_Part_74^
puts %Q^Page_301_Part_75^
puts %Q^Page_307_Part_76^

puts %Q^Page_319_Part_8^

module Aa; end
module Bb; include Aa; end
class Cc; include Bb; end

p Cc < Bb
p Bb < Aa
p Cc < Aa
p Fixnum < Integer
p Fixnum < Comparable
puts
p Integer < Fixnum
p String < Numeric
p Aa.ancestors
p Bb.ancestors
p Cc.ancestors
p String.ancestors
puts
p Cc.include?(Bb)
p Cc.include?(Aa)
p Bb.include?(Aa)
p Aa.include?(Aa)
p Aa.include?(Bb)
p Aa.included_modules
p Bb.included_modules
p Cc.included_modules

module Greeter
	def hi
		"hello"
	end

	def by
		"by"
	end
end

s = "string object"
s.extend(Greeter)
p s.hi; p s.by
String.extend(Greeter)
p String.hi; p String.by
puts
module Mm
	class Cc
		p Module.nesting
	end
end
puts
puts %Q"page323_part82"

x = 1
p eval "x+1"

class Object
	def bindings
		binding
	end
end

class Test
	def initialize(x); @x = x; end
end

t = Test.new(10)

p eval("@x", t.bindings)
p __FILE__
p __LINE__

#def test2

#	raise "В #{__method__} на 0 делить нельзя,  Читать дальше на странице 337, раздел 8.7 =)"

#	a = 1/0

	
#end

#p test2

puts "Page364_Part91"
puts
s = "hello"
s.concat(" world")
p s
s[5] = " there "
p s
s[0,5]
p s
s.slice!(5,6)
p s
p s.eql?("hello world")
p s
p s.length
p s.size
p s.bytesize
p s.empty?
p "".empty?

puts

s = "hello"
p s.index('l')
p s.index(?l)
p s.index(/l+/)
p s.index('l', 3)
p s.index('ruby')
p s.rindex('l')
p s.rindex('l', 2)

p s.start_with? "hell"
p s.end_with? "bells"

p s.include?("ll")
p s.include?(?H)

p s =~ /[aeiou]{2}/
p s.match(/[aeiou]/) {|m| m.to_s}

puts

p "this is it".split
p "hello".split('l')
p "1, 2,3".split(/,\s*/)

puts

p "banana".partition("an")
p "banana".rpartition("an")
p "a123b".partition(/\d+/)

puts

p s.sub("l", "L")
p s.gsub("l", "L")
p s.sub!(/(.)(.)/, '\2\1')
p s.sub!(/(.)(.)/, "\\2\\1")

p "hello world".gsub(/\b./) {|match| match.upcase}

puts

s = "world"
p s.upcase
p s
p s.upcase!
p s
p s.downcase
p s.capitalize
p s.capitalize!
p s.swapcase

p "world".casecmp("WORLD")
p "world" <=> "WORLD"
p "a" <=> "B"

puts

s = "hello\r\n"
p s
p s.chomp!
p s.chomp
p s.chomp!
p s.chomp("o")
$/ = ";"
p "hello;".chomp

puts

s = "hello\n"
p s.chop!
p s.chop
p "".chop
p "".chop!

puts

s = "\t hello \n"
p s.strip
p s.lstrip
p s.rstrip

s = "x"
p s
p s.ljust(3)
p s.rjust(3)
p s.center(3)
p s.center(5, '-')
p s.center(7, '-=')

puts "parsing"

p "10".to_i
p "10".to_i(2)
p "10x".to_i
p " 10".to_i
p "ten".to_i
p "10".oct 
p "10".hex
p "0xff".hex
p " 1.1 dozen".to_f
p "6.02e23".to_f
p "one".to_sym
p "two".intern

puts

p "a".succ
p "aaz".next
p "a".upto("e") {|c| print c}

p "hello".reverse
p "hello\n".dump
p "hello\n".inspect
p "hello".tr("aeiou", "AEIOU")
p "hello".tr("aeiou", " ")
p "deab".tr_s("aeiou", " ")
p "hello".sum
p "hello".sum(8)
p "hello".crypt("ab")

puts

p "hello".count('aeiou')
p "hello".delete('aeiou')
p "hello".squeeze("a-z")

p "hello".count('a-z', '^aeiou')
p "hello".delete!('a-z', '^aeiou')

puts
p "PART 9.1.1"
puts

n, animal = 2, "mice"
p "#{n+1} blind #{animal}"

printf('%d blind %s', n+1, animal)
sprintf('%d blind %s', n+1, animal)
puts
puts '%d blind %s' % [n+1, animal]
p '%d' % 10
p '%x' % 10
p '%X' % 10
p '%o' % 10
p '%f' % 10
p '%e' % 10
p '%E' % 10
p '%5s' % "<<<"
p '%-5s' % ">>>"

p '%5d' % 123
p '%05d' % 123

puts
p "PART 9.1.2", "PAGE 370"
puts
puts
p "PART 9.2", "PAGE 371"
puts
#p %r/Ruby?/
p money = /[$\u20AC\u{a3}\u{a5}]/
p Regexp.new("Ruby?")

puts
p "PART 9.2.3", "PAGE 374"
puts

a = "Ruby5"
puts /Rub/ =~ a
pattern = /Ruby?/i
puts pattern =~ "backrub"

puts
p "PART 9.2.3", "PAGE 382"
puts

p "ruby123"[/\d+/]
p "ruby123"[/([a-z]+)(\d+)/,1]
p "ruby123"[/([a-z]+)(\d+)/,2]

s = "one, two, three"
p s.split
p s.split(", ")
p s.split(/\s*,\s*/)
text = "hello world"
pat = /l/
p first = text.index(pat)
p n = Regexp.last_match.end(0)
p second = text.index(pat, n)
p last = text.rindex(pat)

puts
p "PART 9.2.4.3", "PAGE 382" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

phone = "8^900%888%88-88" #ss
puts phone.gsub!(/\D/,"")
puts phone.gsub!("8","9")

txt = "Ruby Java perl PyThOn"
lang = /ruby|java|perl|python/i
puts txt.gsub!(lang) {|i| i.capitalize}

puts
p "PART 9.3", "PAGE 385" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p 0.zero?
p 1.0.zero?
p 0.0.nonzero? # nil = false
p 1.nonzero? # 1 = true
p 1.integer?
#p 1.0.scalar? не заработало

p 0.even?
p 0.odd?

ZERO, INF, NAN = 0.0, 1.0/0.0, 0.0/0.0
p ZERO.finite?
p INF.finite?
p NAN.finite?
p ZERO.infinite?
p INF.infinite?
a = -INF.infinite?
p a
p ZERO.nan?
p INF.nan?
p NAN.nan?

p 1.1.ceil
p 1.9.floor
p 1.1.round
p 1.1.truncate
a = -2.0.abs
p a

puts
p "PART 9.3.2", "PAGE 386" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p Math::PI
p Math::E
p Math.sqrt(25.0)
p 27.0**(1.0/3.0)

puts
p "PART 9.3.3 PAGE 386" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

require 'bigdecimal'

p dime = BigDecimal("0.1")
p 4*dime - 3*dime == dime

puts
p "PART 9.3.4 PAGE 388" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

#require 'complex'
#require 'rational'
#require 'matrix'

puts
p "PART 9.3.7 PAGE 390" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p rand
p rand
p rand(100)
p rand(100)
srand(0)
p a = [rand(100), rand(100)]
srand(0)
p b = [rand(100), rand(100)]

puts
p "PART 9.4 PAGE 390" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p Time.now
p Time.new
p Time.local(2007,7,8)
p Time.utc(2007,7,8,9,10)
p Time.gm(2007,7,8,9,10,11)

t = Time.utc(2000,12,31,23,59,59,999999)
p t
p t.year
p t.month
p t.day
p t.wday #день недели, 0 - вс
p t.yday #високосный
p t.hour
p t.min
p t.sec
p t.usec
p t.zone

p values = t.to_a
p values[5] += 1
p Time.utc(*values)

p t.utc?
p t.sunday?
p t.monday?

p t.to_s
p t.ctime
p t.strftime("%Y-%m-%d %H:%M:%S")

puts

#require 'parsedate' старые данные, нет такой библиотеки
#include ParseDate

#datestring = "2001-01-01"
#p values = parsedate(datestring)

p now = Time.now
p past = now - 10
p future = now + 10
p future - now

p past <=> future
p past < future
p past >= future
p past == now

p t = Time.now.to_i
p Time.at(t)
p t - Time.now.to_f
p Time.at(0)

puts
p "PART 9.5 PAGE 393" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p (5..7).each {|x| print x}
p (5..7).each_with_index {|x,i| print x, i}
#require "enumerator"
p (1..10).each_slice(4) {|x| print x}
p (1..5).each_cons(3) {|x| print x }
puts
data = [1,2,3,4]
p roots = data.collect {|x| Math.sqrt(x)}
puts 
words = %w[hello world]
p upper = words.map {|x| x.upcase}
puts
p (1..3).zip([4,5,6]) {|x| print x.inspect}
p (1..3).zip([4,5,6],[7,8]) {|x| print x}
p (1..3).zip('a'..'c') {|x,y| print x,y }
puts
p (1..3).to_a
require 'set'
p (1..3).to_set

puts
p "PART 9.5.1.2 PAGE 395" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p e = [1..10].to_enum
p e = "test".enum_for(:each_byte)
p "Ruby".each_char.max

p w = Set['apple','Beet','cerrot']
p w.sort
p w.sort {|a,b| b<=>a}
p w.sort {|a,b| a.casecmp(b)}
p w.sort_by {|x| x.downcase}

puts 

primes = Set[2,3,4,5]
p primes.include? 2
p primes.member? 1

data = [[1,2],[0,1],[7,8]]
p data.find {|x| x.include? 1}
p data.detect {|x| x.include? 3}
p data.find_index {|x| x.include? 1}

puts

p e = (1..8).select {|x| x%2==0}
p e = (1..8).find_all {|x| x%2==1}
p e = [2,3,5,7].reject {|x| x%2==0}
p e = (1..8).partition {|x| x%2==0}

puts

langs = %w[ java perl python ruby]
p g = langs.group_by {|l| l[0]}

p langs.grep(/^p/)
p langs.grep(/^p/) {|x| x.capitalize}

puts
p "PART 9.5.1.6 PAGE 399" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p e = [10,100,1].min
p e = [10,100,1].max 
#p e = [10,100,1,[]].min
langs = %w[ java perl python ruby]
p langs.max {|a,b| a.size <=> b.size}
p langs.max_by {|w| w.length}

p e = (1..100).minmax
p e = (1..100).minmax_by {|n| n.to_s}

c = -2..2
p c.all? {|x| x>0}
p c.any? {|x| x>0}
p c.none? {|x| x>2}
p c.one? {|x| x>0}
p c.one? {|x| x>2}
p c.one? {|x| x==2}
p e = [1,2,3].all?
p e = [nil,false].any?
p e = [].none?

a = [1,1,2,3,5,8]
p a.count(1)
p a.count {|x| x%2 == 1}

puts
p "PART 9.5.2 PAGE 401" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p nils = Array.new(3)
p copy = Array.new(nils)
p zero = Array.new(4, 0)
p Array.new(3) {|i| i+1}
p a = Array.new(3, 'a')
p a[0].upcase!
p a = Array.new(3) {'b'}
p a[0].upcase!
p a

puts

p a = [1,2,3].length
p a = [].size
p a = [].empty?
#p a = [1,2,nil].nitems метод не работает
#p a = [1,2,3].nitems {|x| x>2}

a = %w[ a b c d ]
p a[0]
p a[-1]
p a[a.size-1]
p a[-a.size-1]
p a[5]
p a.at(2)
p a.fetch(1)
p a.fetch(5, "Exit of array")
p a.first
p a.last
#p a.choice
p a[0,2]
p a[0..2]
p a[0...2]

p a.values_at(0,2)
p a.values_at(4,3,2,1)

puts
p "PART 9.5.2.3 PAGE 403" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

a = [1,2,3]

a[0]=0; p a
a[-1] = 4; p a
a[1] = nil; p a

a = [1,2,3]

a[3] = 4; p a
a[5] = 6; p a
a << 7; p a
a << 8 << 9; p a

a = [1,2,3]

p a + a
p a.concat([4,5])

a = ['a', 'b', 'c']
p a.insert(1,1,2)

a = [1,2,3,4,5,6]
p a.delete_at(4); p a
p a.delete_at(-1); p a
p a.delete(4); p a
a[1] = 1; p a
p a.delete(1); p a

a = [1,2,3]
p a.delete_if {|i| i%2==1}
p a.reject! {|i| i%2==0}

a = [1,2,3,4,5,6,7,8]
p a.slice!(0); p a
p a.slice!(-1,1); p a
p a.slice!(2..3); p a
p a.slice!(4,2); p a

puts

a = ('a'..'e').to_a; p a
a[0,2] = ['A','B']; p a
a[2...5]=['C','D','E']; p a
a[0,0] = [1,2,3]; p a
a[0..2] = []; p a
p a.clear

puts
p "PART 9.5.2.4 PAGE 404" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

a = ['a', 'b', 'c']
a.each {|i| print i}
a.reverse_each {|i| print i}
#a.cycle {|i| print i} #uups
a.each_index {|i| print i}
p a.map {|i| i.upcase}

puts

a = %w[h e l l o]

p a.include?('e')
p a.include?('w')
p a.index('l')
p a.index('L')
p a.rindex('l')
p a.index {|i| i =~ /[aeiou]/}

p a.sort
p a.sort!

p a.shuffle!

puts
p "PART 9.5.2.5 PAGE 405" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

a1 = [1,2]
a2 = []
p a1 <=> a2

puts
p "PART 9.5.2.6 PAGE 406" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

a =[]
p a.push(1)
p a.push(2,3)
p a.pop; p a

a = []
p a.push(1)
p a.push(2)
p a.shift; p a

puts
p "PART 9.5.2.7 PAGE 406" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

a1 = [1, 1,3,5]
a2 = [1,2,3]
p a1 - a2

small = (0..10).to_a
p small
p even = (0..50).map {|i| i*2}
p smalleven = small & even
p smalleven.include?(8)

p a = [1,1,nil,nil].uniq

puts
p "PART 9.5.2.8 PAGE 407" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

h = { :a => 1, :b => 2}
p h
p a= h.to_a
p a.assoc(:a)
p a.assoc(:b).last
p a.transpose

puts
p "PART 9.5.2.8 PAGE 408" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

p a = [1,2,3].join
p a = [1,2,3].join(", ")
p a = [1,2,3].to_s

p a = [1,2,3,4].pack("CCCC")

p a = [0,1]*3
p a = [1, [2, [3]]].flatten
p a = [1,2,3].zip([:a, :b, :c])
p a.transpose

puts
p "PART 9.5.3 PAGE 408" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

puts :a=>1, :b=>2
puts a:1, b:2

h = {:one => 1, :two => 2}
p h[:one]
p h[:three]
p h.assoc :one

p h.index 1
p h.index 4
p h.rassoc 2

h = {:a => 1, :b => 2}

p h.key?(:a)
p h.has_key?(:b)

p h.include?(:c)
p h.member?(:d)

p h.value?(1)

p h.fetch(:a)
#p h.fetch(:c)
p h.fetch(:c, 33)
p h.fetch(:c) {|i| i.to_s}

h = {:a => 1, :b => 2, :c => 3}

p h.values_at(:c)
p h.values_at(:c, :b)
p h.values_at(:c, :b, :d, :d)

puts

h = {}

h[:a] = 1; p h
h.store(:b,2); p h

h.replace({1=>:a, 2=>:b}); p h

puts
p "PART 9.5.3.4 PAGE 411" #Флэнаган, Мацумото "Язык программирования Ruby"
puts

h = {:a=>1, :b=>2}
p h[:a] = nil; p h
p h.include? :a
p h.delete :b; p h
# p h.delete(:b) {|i| raise IndexError, i.to_s}

h = {:a=>1, :b=>2, :c=>3, :d=>"four"}
p h.reject! {|k,v| v.is_a? String}
p h.delete_if {|k,v| k.to_s < 'b'}
p h.reject! {|k,v| k.to_s < 'b'}
p h.clear

h = {:a=>1, :b=>2, :c=>3}
hh = {}
p h.length
p h.size
p h.empty?
p hh.empty?

p h.keys
p h.values
p h.to_a
p h.flatten
p h.sort
p h.sort {|a,b| a[1]<=>b[1]}

puts
p "PART 9.5.3.6 PAGE 412" #Флэнаган, Мацумото "Язык программирования Ruby"
puts


