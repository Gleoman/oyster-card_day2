class Oystercard
attr_reader :balance, :entry_station, :exit_station, :journey_history

TOP_UP_LIMIT = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(money)
    test_balance = balance + money
    raise "Maximum top-up of #{TOP_UP_LIMIT} amount exceeded" if test_balance > TOP_UP_LIMIT
    @balance += money
  end

  def touch_in(station)
    raise "You have insufficient funds to touch-in" if @balance < MINIMUM_FARE
    @entry_station = station
    @in_journey = true
    in_journey?
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @journey_history << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
    @in_journey = false
    in_journey?
  end

  def in_journey?
    @entry_station ? "in" : "out"
  end

private
  def deduct(fare)
    @balance -= fare
  end

end
