def oniguruma?
    return true if RUBY_VERSION >= "1.9.0"
 
    if defined?(Regexp::ENGINE) # Константа ENGINE определена?
     if Regexp::ENGINE.include?('Oniguruma')
      return true               # Какая-то версия Oniguruma.
     else
      return false              # Старая библиотека,
     end
    end
 
    eval("/(?<!a)b/")           # Новый синтаксис.
     return true                # Сработало: новая библиотека.
    rescue SyntaxError          # Не сработало: старая библиотека.
     return false
    end
 
   puts oniguruma?