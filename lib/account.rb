class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0.00
    @history = []
  end

  def pay_in(amount, date = current_date)
    @balance += amount
    @history << { amount: amount, date: date, type: :credit, balance: balance }
  end

  def withdraw(amount, date = current_date)
    raise 'You are broke, maybe a loan?' if amount > balance
    @balance -= amount
    @history << { amount: amount, date: date, type: :debit, balance: balance }
  end

  def current_date
    Time.new.strftime('%Y-%m-%d')
  end
end
