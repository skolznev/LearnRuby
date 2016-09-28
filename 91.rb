puts 'Year?'
year = gets.chomp
puts 'Mounth?'
mounth = gets.chomp
puts 'Day?'
day = gets.chomp
now = Time.new
dr = Time.mktime(year,mounth,day)
age = ((((now - dr)/60)/60)/24)/365
puts 'Your age ' + age.to_s + '.'
