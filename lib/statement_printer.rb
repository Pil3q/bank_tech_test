require_relative 'account'
class Statement
  def self.print(account)
    account.history.each do |transaction|
      puts "Type: #{transaction[:type]}, amount: £#{transaction[:amount]} at #{transaction[:date]}, balance £#{transaction[:balance]}"
    end
  end
end
