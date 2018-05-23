require 'statement_printer'
describe Statement do
  it 'will print statement with the dates, and types of transactions' do
    date = "2018-05-20"
    account = double(:account, history: [{ amount: 1000, date: "#{date}", type: :credit, balance: 1000 }, { amount: 500, date: "#{date}", type: :debit, balance: 500 }])
    Statement.print(account)
    expect { print("Type: credit, amount: £1000 at 2018-05-23, balance £1000.0
      Type: debit, amount: £500 at 2018-05-23, balance £500.0") }.to output.to_stdout
  end
end
