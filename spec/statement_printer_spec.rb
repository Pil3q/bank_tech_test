require 'statement_printer'
describe Statement do
  it 'will print statement with the dates, and types of transactions' do
    date = "20/05/2018"
    transaction_1 = double(:transaction_1, date: date, credit: 1000, debit: nil, balance: 1000)
    transaction_2 = double(:transaction_1, date: date, credit: nil, debit: 500, balance: 1000)
    transactions = [transaction_1, transaction_2]
    account = double(:account, history: transactions)
    Statement.print(account)
    expect { print("Your mama") }.to output.to_stdout
  end
end
