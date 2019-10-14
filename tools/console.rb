require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Cookie House", "Dough Boy", "CookieHouse.com")
s2 = Startup.new("Tech Museum", "George Washington", "Techy.com")

v1= VentureCapitalist.new("Michelle")
v2 = VentureCapitalist.new("Lauren")
v3 = VentureCapitalist.new("Susie")
v4 = VentureCapitalist.new("Henry")

f1= FundingRound.new(s1, v1, "Angel", 50)
f2 = FundingRound.new(s2, v3, "Pre-Seed", 3000000000)
f3 = FundingRound.new(s2, v3, "Pre-Seed", 500)
f4 = FundingRound.new(s2, v4, "Pre-Seed", 2000000000)
f5 = FundingRound.new(s2, v2, "Pre-Seed", 4000000000)
f6 = FundingRound.new(s1, v4, "Pre-Seed", 6000000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line