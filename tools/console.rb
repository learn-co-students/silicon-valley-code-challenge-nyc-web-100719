require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

v1= VentureCapitalist.new("Big Baller Firm",1000000001)
v2= VentureCapitalist.new("Tiny Baller Firm", 300)

s1= Startup.new("Apple", "Steve Jobs", "Operating System")
s2= Startup.new("Google", "Larry Page", "Search Engine")
s3 = Startup.new("Amazon", "Jeff Bezos", "Online Shopping")

f1= FundingRound.new(s1,v1,"series A",100)
f2= FundingRound.new(s1,v2,"series B",200)
f3= FundingRound.new(s2,v2,"series A",400)
f4= FundingRound.new(s3,v1,"series A",300)
f5= FundingRound.new(s3,v1,"Angel",1000)
f4= FundingRound.new(s3,v2,"Angel",100)





binding.pry
0 #leave this here to ensure binding.pry isn't the last line