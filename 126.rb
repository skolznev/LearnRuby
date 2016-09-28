case "Это строка символов."
    when "одно значение"
     puts "Ветвь 1"
    when "другое значение"
     puts "Ветвь 2"
    when /симв/
     puts "Ветвь 3"
    else
     puts "Ветвь 4"
   end