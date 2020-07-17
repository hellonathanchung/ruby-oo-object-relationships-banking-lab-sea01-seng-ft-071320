require 'pry'
class BankAccount
    @@all = []

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name, balance=1000, status='open')
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def deposit(amount)
        self.balance = self.balance += amount
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && status == "open"
            true
        else 
            false
        end
     end

     def close_account
        self.status = "closed"
     end

     def self.all
        @@all
     end
end
