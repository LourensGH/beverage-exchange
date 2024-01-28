require_relative 'methods'

drink = ""
until drink == "close"
  puts "Enter the drink which was ordered"
  drink = gets.chomp
  if drink == "close"
    puts "Goodnight"
  else
    cal(drink)
  end
end
display(HASH)
