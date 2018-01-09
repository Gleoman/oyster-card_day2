require './lib/oystercard.rb'

RSpec.describe Oystercard do
  context '# .balance' do
    it 'Should return balance as zero' do
      expect(subject.balance).to eq 0
    end
  end

  context '# .top_up' do
    it 'Should credit the top up amount to the balance' do
      money = 10
      new_balance = subject.balance + money
      expect(subject.top_up(money)).to eq new_balance
    end

    it "Should raise an error if top-up takes balance above 90" do
      expect{subject.top_up(100)}.to raise_error "Maximum top-up of #{Oystercard::TOP_UP_LIMIT} amount exceeded"
    end
  end

  context '# .deduct' do
    it "Should deduct the fare from the balance" do
      subject.top_up(20)
      expect(subject.deduct(10)).to eq 10
    end
  end

  context '# .touch_in' do
    it "Should return that the oystercard has been touched-in" do
      subject.top_up(1)
      expect(subject.touch_in).to eq "in"
    end

    it "Should raise an error if touched-in without minimum balance" do
      subject.balance == 0
      expect{subject.touch_in}.to raise_error "You have insufficient funds to touch-in"
    end
  end

  context '# .touch_out' do
    it "Should return that the oystercard has been touched-out" do
      subject.top_up(1)
      subject.touch_in
      expect(subject.touch_out).to eq "out"
    end
  end

  context '# .in_journey?' do
    it "Should return whether the oystercard has been touched in or touched out on a journey" do
      subject.top_up(1)
      subject.touch_in
      expect(subject.in_journey?).to eq "in"
    end
  end

end
