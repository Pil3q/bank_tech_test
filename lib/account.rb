class Account
  attr_reader :balance, :history
  def initialize(transaction = Transaction)
    @balance = 0
    @history = []
    @transaction = transaction
  end

  def pay_in(amount, date = current_date)
    @balance += amount
    @history << @transaction.new(date, amount, nil, balance)
    @balance
  end

  def withdraw(amount, date = current_date)
    raise 'You are broke, maybe a loan?' if amount > balance
    @balance -= amount
    @history << @transaction.new(date, nil, amount, balance)
    @balance
  end

  def current_date
    Time.new.strftime('%d/%m/%Y')
  end
end
