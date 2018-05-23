require 'account'
describe Account do
  let(:transaction) { double(:transaction) }
  let(:date) { double(:date, self: "2018-05-20")}
  before(:each) do
    allow(transaction).to receive(:new)
    @account = Account.new(transaction)
  end
  it 'shows the 0 balance once created' do
    expect(@account.balance).to eq 0
  end
  it 'transaction is saved with the right arguments when paying in' do
    expect(transaction).to receive(:new).with(date, 1000, nil, 1000)
    @account.pay_in(1000, date)
  end
  it 'change the balance when paying in' do
    expect(@account.pay_in(1000, date)).to eq 1000
  end
  it 'transaction is saved with the right arguments when withdrawing' do
    @account.pay_in(1000, date)
    expect(transaction).to receive(:new).with(date, nil, 500, 500)
    @account.withdraw(500, date)
  end
  it 'change the balance when withdrawing' do
    @account.pay_in(1000, date)
    expect(@account.withdraw(500, date)).to eq 500
  end
  it 'adds transaction to the history' do
    expect { @account.pay_in(1000, date) }.to change { @account.history.length }.by(1)
  end
  it 'throws an error while trying to withdraw from empty account' do
    expect { @account.withdraw(500) }.to raise_error 'You are broke, maybe a loan?'
  end
end
