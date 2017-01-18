describe RoverModel do
  let(:rover) { double :rover, get_current_direction: 'W', get_current_position: '1 1' }
  let(:plateau) { double :plateau }

  subject(:rover_model) { described_class.new(rover, plateau) }

  describe 'instantiation' do
    subject(:rover_model) { described_class }

    it "is initialized with a rover and plateau" do
      expect(rover_model.new(rover, plateau)).to be_a described_class
    end
  end

  describe '#get_location_vector' do
    it 'returns the direction and position of rover' do
      expect(rover_model.get_location_vector).to eq "1 1 W"
    end

    it 'instructs rover to get position' do
      expect(rover).to receive(:get_current_position)
      rover_model.get_location_vector
    end

    it 'instruct rover to get direction' do
      expect(rover).to receive(:get_current_direction)
      rover_model.get_location_vector
    end
  end
end
