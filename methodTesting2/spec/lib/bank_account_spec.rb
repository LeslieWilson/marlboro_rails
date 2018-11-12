require "spec_helper"

RSpec.describe BankAccount do
    describe ".new" do
        it "takes an account number and a deposit amount as arguments" do
            bank_account = BankAccount.new(5406327, 1000.00)
            expect(bank_account).to be_a(BankAccount)
        end
    end

    describe "#account_number" do
        it "returns the account number" do
            bank_account = BankAccount.new(5406327, 1000.00)
            expect(bank_account.account_number).to eq(5406327)
        end

    describe "#initial_deposit" do
        it "returns the initial deposit" do
            bank_account = BankAccount.new(5406327, 1000.00)
            expect(bank_account.initial_deposit). to eq(1000)
        end
    describe "#add_transaction" do
        it "stores the transaction in an array" do
            bank_account = BankAccount.new(5406327, 1000.00)
            bank_account.add_transaction(-5.49)
            expect(bank_account.transactions).to include(-5.49)
        end
    describe "#current balance"do
        it "calculates the current balance" do
            bank_account = BankAccount.new(5406327, 1000.00)
            bank_account.add_transaction(-5)
            bank_account.add_transaction(-10)
            bank_account.add_transaction(-20)
            expect(bank_account.current_balance).to eq(965)
        end
    end

    describe "#summary" do
        it "returns a text summary of the account" do
            bank_account.add_transaction(-5)
            bank_account.add_transaction(-10)
            bank_account.add_transaction(-20)
            expect(bank_account.summary).to include("Account Number: 5406327")
            expect(bank_account.summary).to include ("initial deposit: $1000.00")
            expect(bank_account.summary).to include("$-5.00")
        end
    end
    end
    end
    end
end
