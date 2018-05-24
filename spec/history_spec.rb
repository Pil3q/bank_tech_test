require 'history'
describe History do
  describe '#log' do
    it 'logs transactions' do
      transaction = double(:transaction)
      subject.log(transaction)
      expect(subject.transactions).to include transaction
    end
  end
end
