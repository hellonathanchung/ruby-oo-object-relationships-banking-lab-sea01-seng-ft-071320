class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :name

  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > self.amount && self.status == "pending"
      # binding.pry
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance." 
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount 
      self.status = "reversed"
    end
  end
end
 
# binding.pry
# nathan_to_darius = Transfer.new("nathan", "darius", 500) 

# darius_to_nathan = Transfer.new("darius", "nathan", 1000000)

# binding.pry