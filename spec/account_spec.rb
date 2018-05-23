require 'account'
require 'transaction'
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
  it 'will has transaction history with the dates, types and balance' do
    date = "2018-05-20"
    subject.pay_in(1000, date)
    subject.withdraw(500, date)
    expect(subject.history[0].date).to be date
    expect(subject.history[0].credit).to eq 1000.0
    expect(subject.history[0].debit).to be nil
    expect(subject.history[0].balance).to eq 1000.0
    expect(subject.history[1].debit).to eq 500.0
  end
  it 'throws an error while trying to withdraw from empty account' do
    expect { subject.withdraw(500) }.to raise_error 'You are broke, maybe a loan?'
  end
end
