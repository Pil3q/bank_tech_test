require 'statement_printer'
describe Statement do
  describe '#print' do
    date = "20/05/2018"
    let(:transaction_1) { double(:transaction_1, date: date, credit: 1000, debit: nil, balance: 1000) }
    let(:transaction_2) { double(:transaction_1, date: date, credit: nil, debit: 500, balance: 1000) }
    let(:history) { double(:history, transactions: [transaction_1, transaction_2]) }
    let(:account) { double(:account, history: history) }

    it 'will print statement with the dates, and types of transactions' do
      expect { Statement.print(account) }.to output("date || credit || debit || balance\n20/05/2018 ||  || 500.00 || 1000.00\n20/05/2018 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end
