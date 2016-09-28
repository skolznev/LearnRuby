#Глава 6. Символы И Диапазоны
puts sym1 = :"This is a symbol"
puts
#6.1.4. Преобразование Строки В Символ И Обратно
puts a1 = "foobar"
puts b1 = :foobar
if a1 == b1.to_s
  puts "true"
else 
  puts "false"
end
if b1 == a1.to_sym
  puts "true"
else
  puts "false"
end

class Symbol
  def +(other)
    (self.to_s + other.to_s).to_sym
  end
end

class Object
  def accessor?(sym)
    return (self.respond_to?(sym) and self.respond_to?(sym+"="))
  end
end
puts
#6.2. Диапазоны
puts 0..9

#6.2.1. Открытые И Замкнутые Диапазоны
r1 = 3..6
r2 = 3...6
p r1.to_a
p r2.to_a
#6.2.2. Нахождение Границ Диапазона
puts r1.first, r1.last
puts r1.begin, r1.end
p r1.exclude_end?
p r2.exclude_end?
#6.2.3. Обход Диапазона
puts
(3..6).each {|x| puts x}
r3 = "7".."9"
r4 = "7".."10"
puts
r3.each {|x| puts x}
puts "_"
r4.each {|x| puts x}
puts "_"
#6.2.4. Проверка Принадлежности Диапазону
r5 = 23456..34567
x5 = 14142
y5 = 31416
p r5.include?(x5)
p r5.include?(y5)
s5 = "2".."5"
str5 = "28"
p s5.include?(str5)
puts "6.2.5. Преобразование В Массив"
r6 = 3..12
p r6.to_a

puts "6.2.6. Обратные Диапазоны"
s7 = "flowery"
puts s7[0..-2]
puts s7[1..-2]
puts s7[-5..-3]

puts "6.2.7. Оператор Переключения"
#class Transition
#  A, B = :A, :B
#  T, F = true, false
#  Table = {[A,F,F]=>[A,F], [B,F,F]=>[B,T],
#             [A,T,F]=>[B,T], [B,T,F]=>[B,T],
#             [A,F,T]=>[A,F], [B,F,T]=>[A,T],
#             [A,T,T]=>[A,T], [B,T,T]=>[A,T]}
#  def initialize(proc1, proc2)
#    @state = A
#    @proc1, @proc2 = proc1, proc2
#    check?
#  end
#  def check?
#    p1 = @proc1.call ? T : F
#    p2 = @proc2.call ? T : F
#    @state, result = *Table[[@state,p1,p2]]
#    return result
#  end
#end

#line = nil
#trans = Transition.new(proc {line}, /=begin/, /=end/)
#loop do break if eof? line = gets
#  puts line if trans.check?
#end
puts "6.2.8. Нестандартные Диапазоны"

  class Roman
    include Comparable
 
    I,IV,V,IX,X,XL,L,XC,C,CD,D,CM,M =
     1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000
 
    Values = %w[M CM D CD С XC L XL X IX V IV I]
 
    def Roman.encode(value)
     return "" if self == 0
     str = ""
     Values.each do |letters|
      rnum = const_get(letters)
      if value >= rnum
       return(letters + str=encode(value-rnum))
      end
     end
     str
    end
 
    def Roman.decode(rvalue)
     sum = 0
     letters = rvalue.split('')
     letters.each_with_index do |letter,i|
      this = const_get(letter)
      that = const_get(letters[i+1]) rescue 0
      op = that > this ? :- : :+
      sum = sum.send(op,this)
     end
     sum
    end
 
    def initialize(value)
     case value
      when String
       @roman = value
       @decimal = Roman.decode(@roman)
      when Symbol
       @roman = value.to_s
       @decimal = Roman.decode(@roman)
      when Numeric
       @decimal = value
       @roman = Roman.encode(@decimal)
     end
    end
 
    def to_i
     @decimal
    end
 
    def to_s
     @roman
    end
 
    def succ
     Roman.new(@decimal +1)
    end
 
    def <=>(other)
     self.to_i <=> other.to_i
    end
   end
 
   def Roman(val)
    Roman.new(val)
   end

  y6 = Roman(:MCMLXVI)
  y7 = Roman(:MMIX)
  range = y6..y7
  range.each {|x| puts x}


