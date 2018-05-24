require 'account'
describe Account do
  let(:transaction) { double(:transaction) }
  let(:history) { double(:history) }
  let(:date) { double(:date, self: "2018-05-20")}
  context "interaction with transaction" do
    before(:each) do
      allow(transaction).to receive(:new)
      allow(history).to receive(:log)
      @account = Account.new(transaction, history)
    end
    describe '#pay_in' do
      it 'passes right arguments to transaction' do
        expect(transaction).to receive(:new).with(date, 1000, nil, 1000)
        @account.pay_in(1000, date)
      end
      it 'returns balance' do
        expect(@account.pay_in(1000, date)).to eq 1000
      end
    end
    describe '#balance' do
      it 'shows the 0 balance once created' do
        expect(@account.balance).to eq 0
      end
    end
    describe '#withdraw' do
      it 'passes right arguments to transaction' do
        @account.pay_in(1000, date)
        expect(transaction).to receive(:new).with(date, nil, 500, 500)
        @account.withdraw(500, date)
      end
      it 'returns balance' do
        @account.pay_in(1000, date)
        expect(@account.withdraw(500, date)).to eq 500
      end
      it 'throws an error while trying to withdraw from empty account' do
        expect { @account.withdraw(500) }.to raise_error 'You are broke, maybe a loan?'
      end
    end
  end
    context 'interaction with history' do
      before(:each) do
        allow(transaction).to receive(:new) { transaction }
        @account = Account.new(transaction, history)
      end
        it 'logs pay in transaction in a history' do
          expect(history).to receive(:log).with(transaction)
          @account.pay_in(1000, date)
        end
    end
end
