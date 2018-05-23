class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def pay_in(amount, date = current_date)
    @balance += amount
    @history << Transaction.new(date, amount, nil, balance)
  end

  def withdraw(amount, date = current_date)
    raise 'You are broke, maybe a loan?' if amount > balance
    @balance -= amount
    @history << Transaction.new(date, nil, amount, balance)
  end

  def current_date
    Time.new.strftime('%d/%m/%Y')
  end
end
