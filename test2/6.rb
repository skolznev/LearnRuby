#Какими могут быть СТРОКИ в Ruby
s1 = 'Это строка'
s2 = 'It\'s string'
s3 = 'Смотри в C:\\Temp'
puts s1
puts s2
puts s3
puts
s4 = "Это знак табуляции: (f\tf)"
s5 = "Несколько символов забоя: xyz\b\b\b"
s6 = "Это тоже знак табуляции: f\011f"
s7 = "А это символы подачи звукового сигнала: f\a\007f"
puts s4
puts s5
puts s6
puts s7
puts
s8 = %q[Как сказал Магритт, "Ceci n'est pas une pipe."]
s9 = %q[Это не табуляция: (\t)]
s10 = %Q[А это табуляция: (\t)]
puts s8
puts s9
puts s10
puts
s11 = %q(Билл сказал: "Боб сказал: 'This is a string.'")
s12 = %q{Another string.}
s13 = %q<В этой строке есть специальные символы '"{}()[].>
puts s11
puts s12
puts s13
puts
s14 = %q:"Я думаю, что это сделала корова г-жи О'Лори,