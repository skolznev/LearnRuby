width = 40
str = 'text alignment'
puts str.ljust width
puts str.center width
puts str.rjust width
puts (str.ljust (width/2)) + (str.rjust (width/2))