#Глава 5. Численные Методы

puts 64**2
puts 3/3
puts 3/4
puts 3.0/4

#5.3. Округление Чисел С Плавающей Точкой

pi = 3.1415926535
puts pi.round
temp = -47.6
puts temp.round
puts
puts eval(sprintf("%8.6f",pi))
puts eval(sprintf("%8.5f",pi))
puts eval(sprintf("%8.4f",pi))

class Float
  def roundf(places)
    temp = self.to_s.lenght
    sprintf("#{temp}.#{places}f",self).to_f
  end

  def round2
    whole = self.floor
    fraction = self - whole
      if fraction == 0.5
        if (whole % 2) == 0
          whole
        else
          whole + 1
        end
      else
        self.round
      end
  end

  def roundf2(places)
     shift = 10**places
     (self * shift).round2 / shift.to_f
  end
end

puts 33.4.round2
puts 33.5.round2

puts
puts 6.125.roundf2(2)
puts 6.135.roundf2(2)

#5.4. Сравнение Чисел С Плавающей Точкой

class Float2

  EPSILON = 1e-6

  def == (x)
    (self-x).abs < EPSILON
  end
end
x = 1000001.0/0.003
y = 0.003*x
if y == 1.0
  puts "yes"
else
  puts 'no'
end
#5.5. Форматирование Чисел Для Вывода
puts
x2 = 345.6789
i2 = 123
printf("x2 = %6.2f\n", x2)
printf("x2 = %9.2e\n", x2)
puts sprintf("%5.1f", x2)
puts "%5.1f" % x2
puts "%6.2f, %05d" % [x2,i2]
#5.6. Вставка Разделителей При Форматировании Чисел
puts
def commas(x)
  s2 = x.to_s.reverse
  s2.gsub!(/([0-9]{3})/,"\\1,")
  s2.gsub(/,$/,"").reverse
end
puts commas(123)
puts commas(1234)
puts commas(12345)
#5.7. Работа С Очень Большими Числами
puts
num1 = 1000000
num2 = num1 * num1
puts num1
puts num1.class
puts num2
puts num2.class
#5.8. Использование Класса BigDecimal
puts
if (3.2 - 2.0) == 1.2
  puts "равны"
else
  puts "не равны"
end

require 'bigdecimal'
x3 = BigDecimal("3.2")
y3 = BigDecimal("2.0")
z3 = BigDecimal("1.2")

if (x3 - y3) == z3
  puts "равны"
else
  puts "не равны"
end

puts a3 = x3*y3*z3
puts a3.to_s
puts a3.to_f

x4 = BigDecimal("1.234",10)
y4 = BigDecimal("1.234",15)
print x4.precs
print y4.precs
puts
a5 = BigDecimal("1.23456")
b5 = BigDecimal("2.45676")
c5 = a5 + b5
puts c5
c6 = a5.add(b5,4)
puts c6
puts
puts d5 = a5 - b5
puts d6 = a5.sub(b5,4)
puts
puts e5 = a5 * b5
puts e6 = a5.mult(b5,4)
puts
puts a5/b5
puts a5.div(b5,4)
#5.9. Работа С Рациональными Числами
puts
puts a7 = Rational(1,2)
puts b7 = Rational(6,2)
puts a7+b7
puts a7-b7
puts
puts x7 = Rational(1000001,1)/Rational(3,1000)
puts y7 = Rational(3,1000)*x7
if y7 == 1000001.0
  puts "yes"
else
  puts "no"
end
puts
puts z7 = Rational(9,16)
puts Math.sqrt(z7)
puts z7**0.5
puts z7**Rational(1,2)
#5.10. Перемножение Матриц
puts
require 'matrix'
row1 = [2,3]
row2 = [4,5]
m81 = Matrix.rows([row1,row2])
m82 = Matrix.rows([row1,row2],false) #Не копировать 
row1[1] = 99
p m81
p m82
p
p Matrix.identity(3)
p Matrix.I(3)
p Matrix.unit(3)
p Matrix.scalar(3,8)
p Matrix.diagonal(2,3,7)
p Matrix.zero(3)
#p Matrix.row_vector(2,4,6,8)
#p Matrix.column_vector(6,7,8,9)
m9 = Matrix[[1,2,3],[4,5,6]]
puts m9[1,2]
p
#m10 = Matrix[[1,2,3],[4,5,6],[7,8,9]]
#m11 = Matrix[[1,2,3],[4,5,6],[7,8]]
#p m10.row_size

#5.11. Комплексные Числа
p
puts Complex(3,5)
#puts a9 = 3.im

#5.12. Библиотека Mathn
puts
puts a10 = 1/2 #Странный результат ) 
puts a10.to_f
puts Rational(1,2)

#5.13. Разложение На Простые Множители, Вычисление НОД И НОК

require 'mathn'
#n11 = 36.gcd2(120) # 12 k = 237.gcd2(79) # 79
x11 = 126.prime_division
p x11

#5.14. Простые Числа
list = []
gen = Prime.new
gen.each do |prime|
  list << prime
  break if list.size == 100
end
p list

   class Integer
    def prime?
     max = Math.sqrt(self).ceil
     max -= 1 if max % 2 == 0
     pgen = Prime.new
     pgen.each do |factor|
      return false if self % factor == 0
      return true if factor > max
     end
    end
   end
p 31.prime?

#5.15. Явные И Неявные Преобразования Чисел
puts

#5.16. Приведение Числовых Значений
class MyNumberSystem
  def +(other)
    if other.kind_of?(MyNumberSystem)
      result = some_calculation_between_self_and_other
      MyNumberSystem.new(result)
    else
      n1,n2 = other.coerce(self)
      n1 + n2
    end
  end
end

#5.17. Поразрядные Операции Над Числами
x12 = 0377
y12 = 0b00100110
z12 = 0xBEEF

a12 = x12 | z12
b12 = x12 & z12
c12 = x12 ^ z12
d12 = ~ y12

x13 = 8
y13 = -8

puts x13 >> 2
puts y13 >> 2
puts x13 << 2
puts y13 << 2

#5.18. Преобразование Системы Счисления
puts 237.to_s(2)
puts 237.to_s(5)
puts 237.to_s(8)
puts 237.to_s
puts 237.to_s(16)
puts 237.to_s(30)
p
puts "%x" % 1234
puts "%o" % 1234
puts "%b" % 1234
#s14 = rintf(str14,"Nietzsche is %x\n",57005)

#5.19. Извлечение Кубических Корней, Корней Четвертой Степени И Т.Д.
puts
x14 = 531441
puts Math.exp(Math.log(x14)/3.0)
puts Math.exp(Math.log(x14)/4.0)
include Math
y15 = 4096
puts y15**(1.0/3.0)
puts y15**(1.0/4.0)
puts sqrt(sqrt(y15))

#5.20. Определение Порядка Байтов

#def endianness
#    num = 0x12345678
#    little = "78563412"
#    big = "12345678"
#    native = [num].pack('1')
#    netunpack = native.unpack('N')[0]
#    str = "%8x" % netunpack
#    case str 
#     when little
#      "LITTLE"
#    when big
#     "BIG"
#    else
#     "OTHER"
#    end
#end
#puts endianness
# где-то тут ошибка, при netunpack.to_i выдает другой результат
    
 #5.21. Численное Вычисление Определенного Интеграла
 def integrete(x0, x1, dx=(x1-x0)/1000.00)
  z = x0
  sum = 0
  loop do
  m = yield(z)
  sum += dx * m
  z += dx
  break if z > x1
end
sum
end

def f(x)
  x**2
end

puts integrete(0.0,5.0) {|z| f(x)}, "\n"

#5.22. Тригонометрия В Градусах, Радианах И Градах
puts
module Math
  RAD2DEG = 360.0/(2.0*PI)
  RAD2GRAD = 400.0/(2.0*PI)
end

def sin_d(theta)
  Math.sin(theta/Math::RAD2DEG)
end
def sin_g(theta)
 Math.sin(theta/Math::RAD2GRAD) 
end
puts sin_d(100)
puts sin_g(50)

#5.25. Вычисление Среднего, Медианы И Моды Набора Данных
puts

def mean(x)
  sum = 0
  x.each {|v| sum += v}
  sum/x.size
end

def hmean(x)
  sum = 0
  x.each {|v| sum += (1.0/v)}
  x.size/sum
end

def gmean(x)
  prod = 1.0
  x.each {|v| prod *= v}
  prod**(1.0/x.size)
end

data = [1.1, 2.3, 3.3, 1.2, 4.5, 2.1, 6.6]

puts mean(data)
puts hmean(data)
puts gmean(data)

def median(x)
  sorted = x.sort
  mid = x.size/2
  sorted[mid]
end

data2 = [7,7,7,4,4,5,4,5,7,2,2,3,3,7,3,4]
puts median(data2)

def mode(x)
  f = {}
  fmax = 0
  m = nil
  x.each do |v|
    f[v] ||= 0
    f[v] += 1
    fmax,m = f[v], v if f[v] > fmax
  end
  return m
end
data3 = [7,7,7,4,4,5,4,5,7,2,2,3,3,7,3,4]
puts mode(data3)
#5.26. Дисперсия И Стандартное Отклонение
puts
data4 = [2, 3, 2, 2, 3, 4, 5, 5, 4, 3, 4, 1, 2]

def variance(x)
  m = mean(x)
  sum = 0.0
  x.each {|v| sum += (v-m)**2}
  sum/x.size
end

def sigma(x)
  Math.sqrt(variance(x))
end
puts variance(data4)
puts sigma(data4)

#5.27. Вычисление Коэффициента Корреляции
puts
def correlation(x,y)
  sum = 0.0
  x.each_index do |i|
    sum += x[i]*y[i]
  end
  xymean = sum/x.size.to_f
  xmean = mean(x)
  ymean = mean(y)
  sx = sigma(x)
  sy = sigma(y)
  (xymean - (xmean * ymean))/(sx * sy)
end

a = [3, 6, 9, 12, 15, 18, 21]
b = [1.1, 2.1, 3.4, 4.8, 5.6]
c = [1.9, 1.0, 3.9, 3.1, 6.9]

puts correlation(a,a)
puts correlation(a,a.reverse)
puts correlation(b,c)

#5.28. Генерирование Случайных Чисел
puts
puts rand(10)
srand(5)
puts(rand(100))
puts(rand(100))
puts(rand(100))
#5.29. Кэширование Функций С Помощью Метода Memoize
puts



