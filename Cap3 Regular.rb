#Глава 3. Регулярные Выражения

#3.4. Якоря
s1 = "abcXdefXghi"
puts /def/ =~ s1
puts /abc/ =~ s1
puts /ghi/ =~ s1
puts /^def/ =~ s1
puts /def$/ =~ s1
puts /^abc/ =~ s1
puts /ghi$/ =~ s1
puts
s2 = "abc\ndef\nghi"
puts /def/ =~ s2  # 4
puts /abc/ =~ s2  # 0
puts /ghi/ =~ s2  # 8
puts /^def/ =~ s2 # 4
puts /def$/ =~ s2 # 4
puts /^abc/ =~ s2 # 0
puts /ghi$/ =~ s2 # 8
puts
s3 = "abc\ndef\nghi"
/\Adef/ =~ s3 # nil
/def\Z/ =~ s3 # nil
/\Aabc/ =~ s3 # 0
/ghi\Z/ =~ s3 # 8 не работает почему-то
#s4 = "abc\ndef\nghi"
#s5 << "\n"
#/ghi\Z/ =~ s4 # 8
#/\Aabc/ =~ s5 # 8
#/ghi\z/ =~ s4 # 8
#/ghi\z/ =~ s5 # nil не работает тоже

s6 = "this is a test"
puts s6.gsub(/\b/,"|")
puts s6.gsub(/\B/,"-")

#3.5. Кванторы
s7 = /ax?b/
s8 = /a[xy]?b/
puts s7 =~ "ab"
puts s7 =~ "acb"
puts s7 =~ "axb"
puts s8 =~ "ayb"
puts s8 =~ "acb"
puts
s9 = /[0-9]+/
puts s9 =~ "1"
puts s9 =~ "234567"
puts s9 =~ "-100"
puts
s10 = /Huzzah(!+)?/
puts s10 =~ "Huzzah"
puts s10 =~ "Huzzah!!!!!!"
puts
s11 = /Huzzah!*/
puts s11 =~ "Huzzah"
puts s11 =~ "Huzzah!!!!!!"
puts
s12 = "987-65-4320"
#s13 = /\d\d\d-\d\d-\d\d\d\d/
#или
s13 = /\d{3}-\d{2}-\d{4}/
puts s13 =~ s12
puts
#3.6. Позитивное И Негативное Заглядывание Вперед
#непонятный код (

#3.7. Обратные Ссылки - все ниже не работает правильно ( я ХЗ
s14 = "а123b45с678"
  if /(a\d+)(b\d+)(c\d+)/ =~ s14
    puts "Частичные соответствия: '#$1', '#$2', '#$3'"
  else
    puts "nil"
  end
s15 = "а123b45с678"
puts s15.sub(/(a\d+)(b\d+)(c\d+)/, "1st=#$1, 2nd=#$2, 3rd=#$3")
s16 = "а123b45с678"
s17 = "1st=#$1, 2nd=#$2, 3rd=#$3"
s18 = /(a\d+)(b\d+)(c\d+)/
puts s16.sub(s18,s17)
s19 = "а123b45с678"
puts s19.sub(/(a\d+)(b\d+)(c\d+)/, '1st=\1, 2nd=\2, 3rd=\3')
s20 = "а123b45с678"
puts s20.sub(/(a\d+)(b\d+)(c\d+)/, "1st=\1, 2nd=\2, 3rd=\3")
s21 = "а123b45с678"
puts s21.sub(/(a\d+)(b\d+)(c\d+)/, "1st=\\1, 2nd=\\2, 3rd=\\3")
#3.8. Классы Символов
puts
s22 = "abc\007def"
/[[:print:]]*/.match(s22)
puts Regexp::last_match[0]
s23 = "1234def"
/[[:digit:]]*/.match(s23)
puts Regexp::last_match[0]
/[[:digit:]]+[[:alpha:]]/.match(s23)
puts Regexp::last_match[0]
s24 = "Wolf 359"
/\w+/.match(s24)
puts Regexp::last_match[0]
/\w+ \d+/.match(s24)
puts Regexp::last_match[0]
/\w+ \w+/.match(s24)
puts Regexp::last_match[0]
/\s+/.match(s24)
puts Regexp::last_match[0]
#3.9. Обобщенные Регулярные Выражения
puts
#s25 = [ "409 W Jackson Ave",           "No. 27 Grande Place",
#     "16000 Pennsylvania Avenue",   "2367 St. George St.",
#     "22 Rue Morgue",               "33 Rue St. Denis",
#     "44 Rue Zeeday",               "55 Santa Monica Blvd.",
#     "123 Main St., Apt. 234",      "123 Main St., #234",
#     "345 Euneva Avenue, Suite 23", "678 Euneva Ave, Suite A"]
#s26 = / ^                 # Начало строки.
#            ((No\.?)\s+)?      # Необязательно: No[.]
#            \d+ \s+            # Цифры и пробелы.
#            ((\w|[.'-])+       # Название улицы... может
#             \s*               # состоять из нескольких слов.
 #           )+
  #          (,\s*              # Необязательно: запятая и т.д.
   #          (Apt\.?|Suite|\#) # Apt[.], Suite, #
    #         \s+               # Пробелы.
     #        (\d+|[A-Z])       # Цифры или одна буква.
      #      )?
       #     $                  # Конец строки.
        #   /x
#3.10. Сопоставление Точки Символу Конца Строки
s27 = "Rubies are red\nAnd violets are blue.\n"
s28 = /red./
s29 = /red./m
puts s27 =~ s28
puts s27 =~ s29
#3.11. Внутренние Модификаторы
puts
s30 = "abcdef"
r301 = /abc(?i)def/
puts r301.match(s30)
#puts Regexp::last_match[0] 
# не знаю как вывести на монитор результат (

#3.12. Внутренние Подвыражения
s31 = "abccccdef"
r311 = /(abc*)cdef/
r312 = /(?>abc*)cdef/
puts r311 =~ s31
puts r312 =~ s31
puts r311.match(s31).to_a
puts r312.match(s31).to_a
#3.13.3. Некоторые Новые Возможности Oniguruma
puts
#3.13.4 Позитивное И Негативное Оглядывание Назад
s32 = 'GATTACAAACTGCCTGACATACGAA'
puts s32.scan(/T(\w{4})/)
puts
puts s32.scan(/(?<=T)(\w{4})/)
puts
s33 = <<-EOF
  <body> <h1>This is a heading</h1>
   <p> This is a paragraph with some
   <i>italics</i> and some <b>boldface</b>
   in it...</p>
   </body>
EOF
r331 = /(?:^|
  (?<=>)
  )
  ([^<]*)
  /x
puts s33.gsub(r331) {|s| s.upcase}
#3.13.6. Именованные Соответствия
puts
s34 = "Now is the the time for all..."
r341 = /\s+(\w+)\s+\1\s+/
puts r341.match(s34).to_a
#r342 = /\s+(?<anyword>\w+)\s+\k<anyword>\s+/
puts
s35 = "I breathe when I sleep"
r351 = /I (\w+) when I (\w+)/
puts s35.sub(r351,'I \2 when I \1')
r352 = /I (?<verb1>\w+) when I (?<verb2>\w+)/
puts s35.sub(r352,'I \k<verb2> when I \k<verb1>')
#re3 = /(?<spaces>\s+)(?<anyword>\w+)\g<spaces>\k<anyword>\g<spaces>/
puts
s36 = "My hovercraft is full of eels"
r361 = /My (?<noun>\w+) is (?<predicate>.*)/
m361 = r361.match(s36)
puts m361[:noun]
puts m361["predicate"]
puts m361[1]
#3.13.7. Рекурсия В Регулярных Выражениях
#s37 = "а * ((b-c)/(d-e) - f) * g"
#   r371 = /(?         # Начало именованного выражения.
#          \(         # Открывающая круглая скобка.
#           (?:       # Незапоминаемая группа.
#            (?>      # Сопоставление с собственническим выражением:
#              \\[()] # экранированная скобка
#             |       # ЛИБО
#              [^()]  # вообще не скобка. )
#             )       # Конец собственнического выражения.
#             |       # ЛИБО
#             \g      # Вложенная группа в скобках (рекурсивный вызов).
#            )*       # Незапоминаемая группа повторяется нуль или
#                     # более раз.
#           \)        # Закрывающая круглая скобка.
#          )          # Конец именованного выражения.
#         /x
#puts r371.match(s37).to_a
puts
s38 = "bbbaccc"
r381 = /(?<foo>a|b\g<foo>c)/
puts r381.match(s38).to_a
#3.14.1. Сопоставление С IP-Адресом
puts
num39 = "(\\d|[01]?\\d\\d|2[0-4]\\d\25[0-5])"
#num39 = /(\d1[01]?\d\d|2[0-4]\d|25[0-5])/
pat39 = "(#{num39}\.){3}#{num39}$"
ip_pat39 = Regexp.new(pat39)

ip39 = "9.53.97.102" 
if ip39 =~ ip_pat39
  puts "yes"
else
  puts "no"
end
puts
num40 = /[0-9A-Fa-f]{0,4}/
pat40 = /^(#{num40}:){7}#{num40}$/
ipv6_pat40 = Regexp.new(pat40)
v6ip40 = "abcd::1324:ea54::dead::beef"
if v6ip40 =~ ipv6_pat40
  puts "yes"
else
  puts "no"
end
#3.14.2. Сопоставление С Парой «Ключ-Значение»
puts
pat41 = /(\w+)\s*=\s*(.*?)$/
s41 = "color = blue"
mat41 = pat41.match(s41)
puts mat41[1]
puts mat41[2]
#3.14.3. Сопоставление С Числами, Записанными Римскими Цифрами
puts
rom1 = /m{0,3}/i
rom2 = /(d?c{0,3}|c[dm])/i
rom3 = /(l?x{0,3}|x[lс])/i
rom4 = /(v?i{0,3}|i[vx])/i
roman = /^#{rom1}#{rom2}#{rom3}#{rom4}$/
year1985 = "MCMLXXXV"
if year1985 =~ roman
  puts "yes"
else
  puts "no"
end
#3.14.4 Сопоставление С Числовыми Константами
puts
#3.14.5 Сопоставление С Датой И Временем
mo = /(0?[1-9]|1[0-2])/
dd = /([0-2]?[1-9]|[1-3][01])/
yy = /(\d\d)/
hh = /([01]?[1-9]|[12][0-4])/
mi = /([0-5]\d)/
ss = /([0-6]\d)?/

date = /(#{mo}\/#{dd}\/#{yy})/
time = /(#{hh}:#{mi}:#{ss})/

datetime = /(#{date} #{time})/

s42 = "Recorded on 11/18/07 20:31:00"
puts s42.scan(datetime)
#3.14.6. Обнаружение Повторяющихся Слов В Тексте
puts
double_re = /\b(['A-Z]+) +\1\b/i
s43 = "There's there's the the pattern."
puts s43.scan(double_re)
#3.14.7. Поиск Слов, Целиком Набранных Прописными Буквами
puts
allcaps = /\b[A-Z]+\b/
s44 = "This is ALL CAPS"
puts s44.scan(allcaps)
#3.14.8. Сопоставление С Номером Версии
puts
package = "mylib-1.8.12"
puts package.match(/(.*)-(\d+)\.(\d+)\.(\d+)/)
#3.14.9. Еще Несколько Образцов
state = /^A[LKZR] ! C[AOT] | D[EC] | FL | GA | HI | I[DLNA] |
             K[SY] | LA | M[EDAINSOT] | N[EVHJMYCD] | O[HKR] |
             PA | RI | S[CD] | T[NX] | UT | V[TA] | W[AVIY]$/x





