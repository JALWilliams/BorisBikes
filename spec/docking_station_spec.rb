require  'docking_station' 

describe DockingStation do
  # Not sure if this is need to be kept - should be cleaned 
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:bike)}

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      # remember subject == DockingStation.new
      expect(subject.release_bike).to eq bike
      # bike = subject.release_bike
      # expect(bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      docking_station = DockingStation.new
      expect(docking_station.dock(bike)).to eq ([bike])
    end

    it 'raises an error when full' do
      # 20.times {subject.dock(Bike.new)}
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end
      expect {subject.dock(Bike.new)}.to raise_error 'Docking station full'
    end

  end

  describe '#initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

end