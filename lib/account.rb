class Account
  attr_reader :balance
  def initialize
    @balance = 0
    @history = []
  end

  def pay_in(amount)
    date = Time.new.strftime("%Y-%m-%d")
    @balance += amount
    @history << { :amount => amount, :date => date, :type => :credit, :balance => @balance }
  end

  def withdraw(amount)
    raise "You are broken, maybe a loan?" if amount > @balance
    date = Time.new.strftime("%Y-%m-%d")
    @balance -= amount
    @history << { :amount => amount, :date => date, :type => :debit, :balance => @balance }
  end

  def print_statement
    @history.each { |transaction| puts "Type: #{transaction[:type]}, amount: £#{transaction[:amount]} at #{transaction[:date]}, balance £#{transaction[:balance]}"}
  end
end
