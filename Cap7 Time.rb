puts "Глава 7. Дата И Время"
puts "7.1. Определение Текущего Момента Времени"
puts Time.new
puts Time.now
puts "7.2. Работа С Конкретными Датами (После Точки Отсчета)"
puts
puts Time.mktime(2001)
puts Time.mktime(2001,3)
puts Time.mktime(2001,3,15)
puts Time.mktime(2001,3,15,21)
puts Time.mktime(2001,3,15,21,30)
puts Time.mktime(2001,3,15,21,30,15)
puts Time.local(2001,3,15,21,30,15)
puts Time.gm(2001,3,15,21,30,15)
puts Time.utc(2001,3,15,21,30,15)
puts Time.local(0,15,3,20,11,1979,2,324,false,"GMT-8:00")
puts Time.gm(*Time.now.to_a)
puts "7.3. Определение Дня Недели"
puts
time = Time.now
puts time.to_a[6]
puts time.wday
puts time.strftime("%a")
puts time.strftime("%A")
puts "7.4. Определение Даты Пасхи"
puts
#def easter(year)
#  c = year/100
#  n = year - 19*(year/19)
#  k = (c - 17)/25
# i = c - c/4 - (c-k)/3 + 19*n + 15
#  i = i - 30*(i/30)
#  i = i - (i/28)* (1-(i/28)*(29/(i+1))*((21-n)/11))
#  j = year + year/4 + i + 2 - c + c/4
#  j = j - 7*(j/7)
#  l = i-j
#  mounth = 3 + (1+40)/44
#  day = l + 28 - 31*(mounth/4)
#  [mounth, day]
#end
#date = easter 2001
#date = [2001] + date
#t = Time.local *date
#puts t
puts "7.5. Вычисление N-Ого Дня Недели В Месяце"
puts
   def nth_wday(n, wday, month, year)
    if (!n.between? 1,5) or
     (!wday.between? 0,6) or
     (!month.between? 1,12) 
     raise ArgumentError
    end
    t = Time.local year, month, 1
    first = t.wday
    if first == wday
     fwd = 1
    elsif first < wday
     fwd = wday - first + 1
    elsif first > wday
     fwd = (wday+7) - first + 1
    end
    target = fwd + (n-1)*7
    begin
     t2 = Time.local year, month, target
    rescue ArgumentError
     return nil
    end
    if t2.mday == target
     t2
    else
     nil
    end
   end
  puts " 7.6. Преобразование Из Секунд В Более Крупные Единицы"
  puts
  def sec2dhms(secs)
    time = secs.round
    sec = time % 60
    time /= 60
    mins = time % 60
    time /= 60
    hrs = time % 24
    time /= 24
    days = time
    [days, hrs, mins, sec]
  end
  t = sec2dhms(1000000)
  p sec2dhms(1000000)
  puts "#{t[0]} days,"
  puts "7.7. Вычисление Промежутка Времени, Прошедшего От Точки Отсчета"
  puts
  puts Time.at(0)
  puts Time.at(978307200)
  puts Time.now.to_i
  puts "7.8. Високосные Секунды"
  puts
  puts Time.gm(1998,12,31,23,59,59)+1

  puts "7.9. Определение Порядкового Номера Дня В Году"
  puts
  puts Time.now.yday

  puts "7.10. Контроль Даты И Времени"
  puts
  class Time
    def Time.validate(year, mounth=1, day=1, hour=0, min=0, sec=0, usec=0)
      require "date"
      begin
        d = Date.new(year,mounth,day)
      rescue
        return "error"
      end
      Time.local(year,mounth,day,hour,min,sec,usec)
    end
  end

  puts Time.validate(2000,11,30)
  puts Time.validate(2000,11,31)

  puts "7.11. Определение Недели В Году"
  puts

require "date"

date1 = Time.local(2002,5,1)
date2 = Date.new(2002,5,1)

puts date1.strftime("%U").to_i
puts date1.strftime("%W").to_i
puts date2.cweek

date3 = Time.local(2005,5,1)
date4 = Date.new(2005,5,1)
    
puts date3.strftime("%U").to_i
puts date3.strftime("%W").to_i
puts date4.cweek

puts "7.12. Проверка Года На Високосность"
puts

require "date"
puts Date.julian_leap? 1700
puts Date.gregorian_leap? 1700
puts Date.leap? 1700

#class Time2
#  def Time.leap? year
#   if year % 400 == 0
#      true
#    elsif year % 100 == 0
#      false
#    elsif year % 4 == 0
#      true
#    else
#      false
#    end
#  end
  
#  puts Time2.leap? 2000
puts "7.13. Определение Часового Пояса"
puts
puts Time.gm(2000,11,10,22,5,0).zone
puts Time.local(2000,11,10,22,5,0).zone

puts "7.14. Манипулирование Временем Без Даты"
t3 = Time.now
puts t3.strftime("%H:%M:%S")
puts t3.strftime("%H:%M")
puts (t3+30).strftime("%H:%M")
puts t3.strftime("%I:%M %p")

puts "7.15 Сравнение Моментов Времени"
puts
tm0 = Time.local(2000,11,10,22,15)
tm1 = Time.local(2000,11,9,23,45)
tm2 = Time.local(2000,11,12,8,10)
tm3 = Time.local(2000,11,11,10,25)

if tm0 < tm1 then puts "tm0 < tm1" else puts "hz" end
if tm1 != tm2 then puts "tm1 != tm2" end
if tm1 <= tm2 then puts "tm1 <= tm2" end
if tm3.between?(tm1,tm2)
  puts "tm3 находится между tm1 and tm2"
end

puts "7.16 Прибавление Интервала К Моменту Времени"
puts
puts Time.now
puts Time.now + 60
puts Time.now + 3600
puts Time.now + 86400
puts
puts "7.17. Вычисление Разности Между Двумя Моментами Времени"
today = Time.local(2000,11,10)
yesterday = Time.local(2000,11,9)
puts today - yesterday
puts "7.19. Взаимные Преобразования Объектов Date, Time И DateTime"

class Time
  def to_date
    Date.new(year,month,day)
  rescue NameError
    nil
  end

  def to_datetime
    DateTime.new(year,month,day.hour,min,sec)
  rescue NameError
    nil
  end
end

class DateTime
  def to_time
    Time.local(year,month,day.hour,min,sec)
  end
end

class Date
  def to_time
    Time.local(year.month,day)
  end
end
puts "7.20. Извлечение Даты И Времени Из Строки"
puts
   s1 = "9/13/98 2:15am"
   s2 = "1961-05-31"
   s3 = "11 July 1924"
   s4 = "April 17, 1929"
   s5 = "20 July 1969 16:17 EDT"
   s6 = "Mon Nov 13 2000"
   s7 = "August 24, 79" # День разрушения Помпеи.
   s8 = "8/24/79"
 
#require "parsedate.rb"
#include ParseDate
# Библиотека parsedate не установлена
#p parsedate(s1)
puts "7.21. Форматирование И Печать Даты И Времени"
puts 
puts "7.22. Преобразование Часовых Поясов"
mississippi = Time.local(2000,11,13,9,35)
celif = mississippi - 2 * 3600

puts mississippi.strftime("%X CST")
puts celif.strftime("%X PST")
puts "7.23. Определение Числа Дней В Месяце"
puts
require 'date'
def month_days(month,year=Date.today.year)
  mdays = [nil,31,28,31,30,31,30,31,31,30,31.30,31]
  mdays[2] = 29 if Date.leap?(year)
  mdays[month]
end

puts month_days(5)
puts month_days(2,2000)
puts month_days(2,2100)
puts "7.24. Разбиение Месяца На Недели"
puts
def calendar(month,year)
    days = month_days(month,year)
    t = Time.mktime(year,month,1)
    first = t.wday
    list = *1..days
    weeks = [[]]
    week1 = 7 - first
    week1.times { weeks[0] << list.shift }
    nweeks = list.size/7 + 1
    nweeks.times do |i|
     weeks[i+1] ||= []
     7.times do
      break if list.empty?
      weeks[i+1] << list.shift
     end
    end
    pad_first = 7-weeks[0].size
    pad_first.times { weeks[0].unshift(nil) }
    pad_last = 7-weeks[0].size
    pad_last.times { weeks[-1].unshift(nil) }
    weeks
   end

arr = calendar(12,2008)

def print_calendar(month,year)
  weeks = calendar(month,year)
  weeks.each do |wk|
    wk.each do |d|
      item = d.nil? ? " "*4 : " %2d " % d
      print item
    end
    puts
  end
  puts
end

print_calendar(12,2008)