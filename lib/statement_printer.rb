class Statement
  def self.print(account)
    p 'date || credit || debit || balance'
    account.history.each do |transaction|
      p "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
