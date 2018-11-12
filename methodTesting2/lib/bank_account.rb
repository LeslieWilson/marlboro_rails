

class BankAccount
    attr_accessor :account_number, :initial_deposit, :transactions
    def initialize(account_number, initial_deposit)
        @account_number = account_number
        @initial_deposit = initial_deposit
        @transactions = []
    end

def add_transaction(amount)
    @transactions << amount
end

def current_balance
    result = initial_deposit
    @transactions.each do |transaction|
        result += transaction
end
return result
end

def summary
    result = "Account Number: #{account_number}\n"
    result += "Initial depsit: $"

    end
end
