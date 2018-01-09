class Oystercard
attr_reader :balance

TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    test_balance = balance + money
    raise "Maximum top-up of #{TOP_UP_LIMIT} amount exceeded" if test_balance > TOP_UP_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
    in_journey?
  end

  def touch_out
    @in_journey = false
    in_journey?
  end

  def in_journey?
    @in_journey ? "in" : "out"
  end

end
