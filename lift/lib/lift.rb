# require 'C:\Users\User\Google Диск\my programming\ruby\tests\lift\lib\lift\main.rb'
# require File.expand_path('..\lift\main.rb',__FILE__) #относительно текущего файла! Как в html
require_relative 'lift\main.rb' # Лучший способо! Относительно текущего файла! Как в html
module Lift



end

lift = Lift::Main.new

# lift.load! 40
# lift.load! 140
# lift.load! 100
# lift.release! 100

# lift.move 7
# lift.move 2