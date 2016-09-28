puts "Глава 14. Сценарии И Системное Администрирование"

puts
puts "14.1. Запуск Внешних Программ"

puts
puts "14.1.1. Методы System И Exec"

system("D:/rb/2.rb")

puts
puts "14.1.2. Перехват Вывода Программы"

puts
puts "14.1.3. Манипулирование Процессами"

puts
puts "14.1.4. Стандартный Ввод И Вывод"

#require "open3"

#filenames = %w[ file1 file2 this that another one_more ]
#inp, out, err = Open3.popen3("xargs", "ls", "-l")
#filenames.each {|f| inp.puts f}
#inp.close
#output = out.readlines
#errout = err.readlines

#puts "Послано #{filenames.size} строк входных данных."
#puts "Получено #{output.size} строк из stdout"
#puts "и #{errout.size} строк из stderr."

puts
puts "14.2. Флаги И Аргументы В Командной Строке"

puts
puts "14.2.1. Разбор Флагов В Командной Строке"

puts
puts "Листинг 14.1. Получение Флагов Из Командной Строки"

#require "getoptlong"

filename = nil
lines = 0

loop do
	begin
		opt, arg = parser.get
		break if not opt
		puts (opt +" => "+ arg)

		case opt
		when "-h"
			puts "Usage:..."
			break
		when "-f"
			filename = arg
		when "-l"
			if arg != ""
				lines = arg
			else
				lines = 100
			end
		end

	rescue => err
		puts err
		break
	end
end

puts "имя файла = #{filename}"
puts "число строк = #{lines}"

puts
puts "14.2.2. Константа ARGF"

puts
puts "14.2.3. Константа ARGV"

puts
puts "14.3. Библиотека Shell"

puts 
puts "14.4. Переменные Окружения"

mypath = ENV["PATH"]
dirs = mypath.split(":")
p dirs

ENV["alpha"] = "123"
ENV["beta"] = "456"
puts "Parent: alpha = #{ENV['alpha']}"
puts "Parent: beta = #{ENV['beta']}"

puts
puts "14.4.3. Импорт Переменных Окружения Как Глобальных Переменных"

were = $PWD
who = $LOGNAME
puts "In catalog #{were}, come at #{who}"

puts
puts "14.5. Сценарии На Платформе Microsoft Windows"

puts
puts "14.5.1. Расширение Win32API"

puts
puts "14.5.2. Расширение Win32OLE"

require "win32ole"

#print "Введите имя файла для распечатки: "
#docfile = gets

#	word = WIN32OLE.new "Word.Application"
#   word.visible = true
#   word.documents.open docfile
#   word.options.printBackground = false
#   word.activeDocument.printout
#   word.quit

puts "Листинг 14.2. Открытие Диалога Для Ввода Текста В Браузере"

#def ieInputBox(msg, default)
#	ie = WIN32OLE.new("InternetExplorer.Application")
#	ie.visible = true
#	ie.navigate "about:blank"
#	sleep 0.01 while (ie.busy)

#	script = ie.Document.Script
#	result = script.prompt(msg, default)
#	ie.quit

#	result
#end

#result = ieInputBox("Введите свое имя", "Дм Ск")
#if result
#	puts result
#else
#	puts "User put Cancel"
#end

puts "Листинг 14.3. Для Вывода В Окно Браузера Требуется Win32ole"

#html = <<EOF
#<html>
#	<body>
#		<h3>And now anything</h3>
#		<h2>sovsem</h2>
#		<h1>drugoe...</h1>
#	</body>
#</html>
#EOF

#ie = WIN32OLE.new("InternetExplorer.Application")

# ie.left = 150
# ie.top = 150
# ie.height = 200
# ie.width = 300
# ie.menubar = 0
# ie.toolbar = 0
# ie.navigate "about:blank"
# ie.visible = true

# ie.document.open
# ie.document.write html
# ie.document.close
# sleep 5
# ie.quit

 #cd = WIN32OLE.new("MSComDlg.CommonDialog")

# cd.filter = "All Files(*.*)| *.*" +
 #   "| Ruby Files(*.rb)|*.rb"
  # cd.filterIndex = 2

# cd.maxFileSize = 128

# cd.showOpen()
# file = cd.filename
# if not file or file == ""
# 	puts "File not found"
# else
# 	puts "User change: #{file}\n"
# end

# ws = WIN32OLE.new("MSWinsock.Winsock")
# ipAddress = ws.localIP
# puts "Local IP is: #{ipAddress}"

puts
puts "14.5.3. Использование ActiveScriptRuby"

puts
puts "14.6. Моментальный Инсталлятор Для Windows"

puts
puts "14.7. Библиотеки, О Которых Полезно Знать"

puts
puts "14.8. Работа С Файлами, Каталогами И Деревьями"

puts
puts "14.8.1. Несколько Слов О Текстовых Фильтрах"

puts
puts "14.8.2. Копирование Дерева Каталогов (С Символическими Ссылками)"

puts
puts "14.8.3. Удаление Файлов По Времени Модификации И Другим Критериям"

puts
puts "14.8.4. Вычисление Свободного Места На Диске"

#require 'Win32API'

#GetDiskFreeSpaceEx = Win32API.new('kernel32', 'GetDiskFreeSpaceEx', 'PPPP', 'I')

#def freespace(dir=".")
#	total_bytes = [0].pack('Q')
#	total_free = [0].pack('Q')
#	GetDiskFreeSpaceEx.call(dir, 0, total_bytes, total_free)
#	total_bytes = total_bytes.unpack('Q').first
#	total_free = total_free.unpack('Q').first
#end

#puts freespace("C:")

puts
puts "14.9. Различные Сценарии"

puts "14.9.1. Ruby В Виде Одного Файла"

puts "14.9.2. Подача Входных Данных Ruby По Конвейеру"

puts "Листинг 14.6. Bash-Сценарий, Вызывающий Ruby"

puts "14.9.3. Получение И Установка Кодов Завершения"

puts "14.9.4. Работает Ли Ruby В Интерактивном Режиме?"

puts "14.9.5. Определение Текущей Платформы Или Операционной Системы"

def os_family
    case RUBY_PLATFORM
     when /ix/i, /ux/i, /gnu/i,
          /sysv/i, /solaris/i,
          /sunos/i, /bsd/i 
      "unix"
     when /win/i, /ming/i
      "windows"
     else
      "other"
    end
   end

p os_family

puts 
puts "14.9.6. Модуль Etc"
