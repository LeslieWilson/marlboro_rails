


puts "d for deposit, w for withrawl, t for transfer"
input = gets.chomp
if input == "d"
    new_deposit = Deposit.new
  new_deposit.make
new_balance = Balance.new(x,y)
puts "your balance is #{Balance.new.total}"
end
