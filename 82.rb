def ask question  #  задать вопрос  
  goodAnswer = false
  while (not goodAnswer)
    puts question
    reply = gets.chomp.downcase
    
    if (reply == 'да' or reply == 'нет')
      goodAnswer = true
      if reply == 'да'
        answer = true
      else
        answer = false
      end
    else
      puts 'Пожалуйста, отвечайте "да" или "нет".'
    end
  end
  
  answer  #  Это то, что мы возвращаем (true или false).
end

puts 'Здравствуйте! И спасибо, что Вы...'
puts
ask 'Вам нравится есть такос?' # Мы игнорируем возвращаемое значение.
ask 'Вам нравится есть бурритос?'
wetsBed = ask 'Вы мочитесь в постель?' # Мы сохраняем возвращаемое значение.
ask 'Вам нравится есть чимичангас?'
ask 'Вам нравится есть сопапиллас?'
ask 'Вам нравится есть тамалес?'
puts 'И ещё несколько вопросов...'
ask 'Вам нравится пить хорчата?'
ask 'Вам нравится есть флаутас?'
puts
puts 'ПОЯСНЕНИЕ:'
puts 'Спасибо за то...'
puts
puts wetsBed