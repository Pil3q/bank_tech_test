class Statement
  def self.print(account)
    to_print =  ['date || credit || debit || balance']
    account.history.each do |transaction|
      if transaction.credit == nil
        row = "#{transaction.date} || #{transaction.credit} || #{"%5.2f" % transaction.debit} || #{"%5.2f" % transaction.balance}"
      else
        row = "#{transaction.date} || #{"%5.2f" % transaction.credit} || #{transaction.debit} || #{"%5.2f" % transaction.balance}"
      end
      to_print.insert(1, row)
    end
    puts to_print
  end
end
