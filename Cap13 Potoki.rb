puts "Глава 13. Потоки В Ruby"

puts
puts "13.1. Создание Потоков И Манипулирование Ими"

puts
puts "13.1.1. Создание Потоков"

#x = 1
#y = 2

#thread = Thread.new do
#  sleep(rand(0))
#  x = 3
#end
#sleep(rand(0))
#puts x

puts
puts "13.1.2. Доступ К Локальным Переменным Потока"

#thread = Thread.new do
#  t = Thread.current
#  t[:var1] = "This string"
#  t[:var2] = 365
#end

#x = thread[:var1]
#y = thread[:var2]

#p has_var2 = thread.key?("var2")
#p has_var3 = thread.key?("var3")

#thread = Thread.new do
#  t = Thread.current
#  x = "nXxeQPdMdxiBAxh"
#  t[:my_message] = x
#  x.reverse!
#  x.delete! "x"
#  x.gsub!(/[A-Z]/,"")
#end
#p a = thread[:my_message]


puts
puts "13.1.3. Опрос И Изменение Состояния Потока"

#   t1 = Thread.new { sleep 100 }
#   t2 = Thread.new do
#    if Thread.current == Thread.main
#    puts "Это главный поток." # HE печатается,
#   end
#   1.upto(1000) { sleep 0.1 }
#   end
 
#   count = Thread.list.size   # 3
#   if Thread.list.include?(Thread.main)
#    puts "Главный поток жив." # Печатается всегда!
#   end
#   if Thread.current == Thread.main
#    puts "Я главный поток."   # Здесь печатается...
#   end

#   Thread.kill(t1)
#   Thread.pass
#   t3 = Thread.new do
#    sleep 20
#    Thread.exit
#    puts "It's not reality"
#  end
#  Thread.kill(t2)
#  Thread.exit

#factorial1000 = Thread.new do
#  begin
#    prod = 1
#    1.upto(1000) {|n| prod *= n}
#    puts "1000! = #{prod}"
#  rescue
    
#  end
#end

#sleep 0.01
#if factorial1000.alive?
#  factorial1000.raise("Stop!")
#  puts "Stop calculate!"
#else
#  puts "calculate is finished"
#end

puts
puts "13.1.4. Назначение Рандеву (И Получение Возвращенного Значения)"

puts
puts "13.1.5. Обработка Исключений"

puts
puts "13.1.6. Группы Потоков"

puts
puts "13.2. Синхронизация Потоков"

#x = 0
#t1 = Thread.new do
#  1.upto(1000) do
#    Thread.critical = true
#    x = x + 1
#    Thread.critical = false
#  end
#end

#t2 = Thread.new do
#  1.upto(1000) do
#    Thread.critical = true
#    x = x + 1
#    Thread.critical = false
#  end
#end

#t1.join
#t2.join
#puts x

puts
puts "13.2.1. Синхронизация С Помощью Критических Секций"

puts
puts "13.2.2. Синхронизация Доступа К Ресурсам (Mutex.Rb)"

puts "Листинг 13.1. Программа Индексирования С Ошибками (Гонка)"




#   require 'thread.rb'
 
#   @list = []
#   @list[0]="shoes ships\nsealing-wax"
#   @list[1]="cabbages kings"
#   @list[2]="quarks\nships\ncabbages"
 
#   def hesitate
#    sleep rand(0)
#   end
 
#   @hash = {}
 
#   @mutex = Mutex.new
 
#   def process_list(listnum)
#    lnum = 0
#    @list[listnum].each do |line|
#     words = line.chomp.split
#     words.each do |w|
#      hesitate
#      @mutex.lock
#      if @hash[w]
#       hesitate
#       @hash[w] += ["#{listnum}:#{lnum}"]
##      else
#       hesitate
#       @hash[w] = ["#{listnum}:#{lnum}"]
#      end
#      @mutex.unlock
#     end
#     lnum += 1
#    end
#   end
 
#   t1 = Thread.new(0) {|num| process_list(num) }
#   t2 = Thread.new(1) {|num| process_list(num) }
#   t3 = Thread.new(2) {|num| process_list(num) }
 
#   t1.join
#   t2.join
#   t3.join
 
#   count = 0
#   @hash.values.each {|v| count += v.size }
 
#   puts "Всего слов: #{count} " # Всегда печатается 8!

puts
puts "13.2.3. Предопределенные Классы Синхронизированных Очередей"

#require "thread"

#buffer = SizedQueue.new(2)

#producer = Thread.new do
#  item = 0
#  loop do
#    sleep rand 0
#    puts "Producer produce #{item}"
#    buffer.enq item
#    item += 1
#  end
#end

#consumer = Thread.new do
#  loop do
#    sleep (rand 0) + 0.9
#    item = buffer.deq
#    puts "Consumer consum #{item}"
#    puts " waiting = #{buffer.num_waiting}"
#  end
#end

#sleep 60

puts
puts "13.2.4. Условные Переменные"

puts "Листинг 13.4. Три Скрипача"
#require 'thread'

#@music = Mutex.new
#@violin = ConditionVariable.new
#@bow = ConditionVariable.new

#@violins_free = 2
#@bows_free = 1

#def musician(n)
#  loop do
#    sleep 3
#    @music.synchronize do
#      @violin.wait(@music) while @violins_free == 0
#      @violins_free -= 1
#      puts "#{n} владеет скрипкой"
#      puts "скрипок #{@violins_free}, смычков #{@bows_free}"

#      @bow.wait(@music) while @bows_free == 0
#      @bows_free -= 1
#      puts "#{n} владеет смычком"
#      puts "скрипок #{@violins_free}, смычков #{@bows_free}"
#    end

#    sleep 2
#    puts "#{n}: (...играет...)"
#    sleep 4
#    puts "#{n}: Я закончил."

#    @music.synchronize do
#      @violins_free += 1
#      @violin.signal if @violins_free == 1
#      @bows_free += 1
#      @bow.signal if @bows_free == 1
#    end
#  end
#end

#thread = []
#3.times {|i| thread << Thread.new {musician(i)}}

#thread.each {|t| t.join}

puts "13.2.5. Другие Способы Синхронизации"

puts "13.2.6. Тайм-Аут При Выполнении Операций"

puts "Листинг 13.6. Пример Тайм-Аута"

#require 'timeout.rb'

#flag = false
#answer = nil

#begin
#  timeout(5) do
##    puts "I want cake!"
#    answer = gets.chomp
#    flag = true
#  end
#rescue TimeoutError
#  flag = false
#end

#if flag
#  if answer == "cookie"
#    puts "Thank's! Khrum, khrum..."
#  else
#    puts "It's not cake! :("
#    exit
#  end
#else
#  puts "Hey, too slow!"
#  exit
#end

#puts "By by :)"

puts
puts "13.2.7. Ожидание События"

#$flag = false
#work1 = Thread.new{job1()}
#work2 = Thread.new{job2()}
#work3 = Thread.new{job3()}

#thread4 = Thread.new{Thread.stop; job4()}
#thread5 = Thread.new{Thread.stop; job5()}

#watcher = Thread.new do
#  loop do
#    sleep 5
#    if $flag
#      thread4.wakeup
##      thread5.wakeup
#      Thread.exit
#    end
#  end
#end

puts
puts "13.2.8. Продолжение Обработки Во Время Ввода/Вывода"

puts
puts "13.2.9. Реализация Параллельных Итераторов"

puts "Листинг 13.7. Параллельные Итераторы"

#require 'thread'
#   def compose(*objects)
#    threads = []
#    for obj in objects do
#     threads << Thread.new(obj) do |myobj|
#      me = Thread.current
#      me[:queue] = []
#      myobj.each {|x| me[:queue].push(x) }
#     end
#    end
 
#    list = [0]                     # Фиктивное значение, отличное от nil.
#    while list.nitems > 0 do       # Еще есть не nil.
#     list = []
#     for thr in threads
#      list << thr[:queue].shift    # Удалить по одному из каждого.
#     end
#     yield list if list.nitems > 0 # He вызывать yield, если все равны nil.
#    end
#   end
 
#   x = [1, 2, 3, 4, 5, 6, 7, 8]
#   y = "    первый\n    второй\n    третий\n четвертый\n    пятый\n"
#   z = %w[a b с d e f]
 
#   compose(x, у, z) {|a,b,c| p [a, b, c] }

puts
puts "13.2.10. Параллельное Рекурсивное Удаление"

