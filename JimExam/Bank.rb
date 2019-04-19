
class Bank
    attr_accessor :checking, :savings
    def initialize
        @checking = 20
        @savings = 30
    end

    def withdraw(input,amount)
        if input == "savings"
            @savings -= amount
        elsif input == "checking"
            @checking -= amount
        end
    end

    def deposit(input,amount)
        if input == "savings"
            @savings += amount
        elsif input == "checking"
            @checking += amount
    end
end
    def transfer(move, amount)
        if move == "s2c"
            @savings -= amount
            @checking += amount
        elsif move == "c2s"
            @checking -= amount
            @savings += amount
        end
end

end

bank = Bank.new

puts "which account do you want to use? say checking,savings"
account = gets.chomp
puts "ok, what do you want to do? choose transfer, deposit, withdraw"
action = gets.chomp
puts "how much money would you like to move? give an integer "
amount = gets.chomp.to_i
if action == "transfer"
    puts "alright, from checking to savings or savings to checking? (type s2c or c2s)"
    move = gets.chomp
    if move == "s2c"
        bank.transfer(move,amount)
        puts "your savings balance is #{bank.savings} and your checking balance is #{bank.checking}"
    elsif move =="c2s"
        bank.transfer(move,amount)
        puts "your checking balance is #{bank.checking} and your savings balance is #{bank.savings}"
end

end
if account == "savings" && action == "deposit"
    bank.deposit(account,amount)
    puts "your balance is #{bank.savings}"
elsif account == "savings" && action == "withdraw"
    bank.withdraw (account, amount)
    puts "your balance is #{bank.savings}"
elsif account == "checking" && action == "withdraw"
    bank.withdraw(account,amount)
    puts "your balance is #{bank.checking}"
elsif account == "checking" && action == "deposit"
    bank.deposit(account,amount)
    puts "your balance is #{bank.checking}"

end
