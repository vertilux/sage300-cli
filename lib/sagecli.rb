#require "sagecli/version"

def run
  welcome
end

def welcome
  @items = Item.count
  puts "Welcome to Sage300 CLI (Vertilux Ltd.)"
  puts "#{@items}"
end
