class BankAccount
  attr_reader :name
  attr_accessor

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    self.balance += amount
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def close_account
    self.status = "closed"
  end
  
  def valid?
    balance > 0 && status == "open"
  end
  
end

  describe '#valid?' do
    it "is valid with an open status and a balance greater than 0" do
      @broke = BankAccount.new("Kat Dennings")
      @broke.balance = 0
      @closed = BankAccount.new("Beth Behrs")
      @closed.status = "closed"
      expect(avi.valid?).to eq(true)
      expect(@broke.valid?).to eq(false)
      expect(@closed.valid?).to eq(false)
