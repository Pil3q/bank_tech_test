class Account
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def pay_in(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
