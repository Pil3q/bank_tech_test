class Account
  attr_reader :balance, :history
  def initialize(transaction = Transaction, history = History.new)
    @balance = 0
    @history = history
    @transaction = transaction
  end

  def pay_in(amount, date = current_date)
    @balance += amount
    @history.log(@transaction.new(date, amount, nil, balance))
    @balance
  end

  def withdraw(amount, date = current_date)
    raise 'You are broke, maybe a loan?' if amount > balance
    @balance -= amount
    @history.log(@transaction.new(date, nil, amount, balance))
    @balance
  end

  def current_date
    Time.new.strftime('%d/%m/%Y')
  end
end
