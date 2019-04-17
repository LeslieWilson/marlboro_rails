class Bank
    attr_accessor :checking, :savings
    def initialize (checking,savings,transfers, withdrawl_savings)
        @checking = []
        @savings = []
        @transfers = []
        @withdrawl_savings = withdrawl_savings
    end


    def deposit_checking
        checking << money
    end

    def deposit_savings
        savings << money
    end

    def transfers
        transfers << money
    end

    def withdrawl_savings
        withdrawl_savings = savings - money
    end
