HASH = {
  'spirit' => { 'vodka' => 40, 'brandy' => 35 },
  'cocktail' => { 'martini' => 80, 'margarita' => 65 },
  'non alchoholic' => { 'coke' => 28, 'iced tea' => 34, 'sprite' => 24 }
}.freeze

# method to display drinks and current prices within hash
def display(hash)
  hash.each do |type, drinks|
    puts "#{type}:"
    drinks.each do |drink, price|
      puts "  #{drink} = R #{price}"
    end
  end
end

# method to find outer key of drink
def find_key(drink)
  HASH.each_key do |type|
    return type if HASH[type].key?(drink)
  end
end

# method to calculate how much to reduce or increase drink price by
def change(drink)
  drink_price = HASH[find_key(drink)][drink]
  drink_price * 0.05
end

# method to calculate drink prices after order
# modify drink prices in specific drinks category depending on drink
def cal(drink)
  key = find_key(drink)
  HASH[key].each do |bev, price|
    new_price = price + (bev == drink ? change(bev) : -change(bev))
    HASH[key][bev] = new_price
  end
end

# # tests
cal('vodka')
display(HASH)
