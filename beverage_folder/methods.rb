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
  key = HASH.find do |type, inner_hash|
    inner_hash.key?(drink)
  end&.first
  return key
end

#method to calculate how much to reduce or increase drink price by
def change(drink)
  drink_price = HASH[find_key(drink)][drink]
  returnprice_change = drink_price * 0.05
end

# method to calculate drink prices after order
# modify drink prices in specific drinks category depending on drink

def cal(drink)
  key = find_key(drink)
  HASH[key].each do |bev, price|
    if bev == drink
      HASH[key][bev] = price + change(bev)
    else
      HASH[key][bev] = price - change(bev)
    end
  end
end

# # tests
# cal('vodka')
# display(HASH)
