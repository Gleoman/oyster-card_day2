require 'station'

RSpec.describe Station do

    it 'initializes station with zone 1' do
      station = Station.new("Aldgate", 1)
      expect(station.zone).to eq 1
    end

    it 'initializes station with a name' do
      station = Station.new("Aldgate", 1)
      expect(station.name).to eq "Aldgate"
    end


end
