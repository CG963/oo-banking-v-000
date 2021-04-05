class Transfer
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject
    end
    
    def reject_transfer
end

describe 'Transfer' do

  describe '#execute_transaction' do
    let(:avi) { BankAccount.new("Avi") }
    let(:amanda) { BankAccount.new("Amanda") }
    let(:transfer) { Transfer.new(amanda, avi, 50) }
    let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

   
    it "rejects a transfer if the sender does not have enough funds (does not have a valid account)" do
      terrance.close_account
      closed_account_transfer = Transfer.new(amanda, terrance, 50)
      expect(closed_account_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
      expect(closed_account_transfer.status).to eq("rejected")

      expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
      expect(bad_transfer.status).to eq("rejected")
    end
  end

  describe '#reverse_transfer' do
    it "can reverse a transfer between two accounts" do
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      transfer.reverse_transfer
      expect(avi.balance).to eq(1000)
      expect(amanda.balance).to eq(1000)
      expect(transfer.status).to eq("reversed")
    end

    it "it can only reverse executed transfers" do
      transfer.reverse_transfer
      expect(amanda.balance).to eq(1000)
      expect(avi.balance).to eq(1000)