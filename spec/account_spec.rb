require 'account'
describe Account do
  it 'shows the balance' do
    expect(subject.balance).to eq 0
  end
  it 'will allow client to pay in' do
    subject.pay_in(1000)
    expect(subject.balance).to eq 1000
  end
  it 'will allow client to withdraw' do
    subject.pay_in(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq 500
  end
  it 'will print statement with the dates, and types of transactions' do
    date = Time.new.strftime('%Y-%m-%d')
    subject.pay_in(1000)
    subject.withdraw(500)
    expect(subject.print_statement).to include({ amount: 1000, date: "#{date}", type: :credit, balance: 1000 }, { amount: 500, date: "#{date}", type: :debit, balance: 500 })
  end
  it 'throws an error while trying to withdraw from empty account' do
    expect { subject.withdraw(500) }.to raise_error 'You are broke, maybe a loan?'
  end
end
