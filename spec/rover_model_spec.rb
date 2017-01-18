describe RoverModel do
  let(:rover) { double :rover, get_current_direction: 'W', get_current_position: '1 1' }

  let(:plateau) { double :plateau, max_x: 5, max_y: 5 }

  subject(:rover_model) { described_class.new(rover, plateau) }

  describe 'instantiation' do
    let(:rover_1) { double :rover, get_current_direction: 'W', get_current_position: '0 0' }
    let(:rover_2) { double :rover, get_current_direction: 'W', get_current_position: '6 3' }
    let(:rover_3) { double :rover, get_current_direction: 'W', get_current_position: '5 9' }
    let(:rover_4) { double :rover, get_current_direction: 'W', get_current_position: '8 8' }

    subject(:rover_model_0) { described_class }

    it "is initialized with a rover and plateau" do
      expect(rover_model_0.new(rover, plateau)).to be_a described_class
    end

    subject(:rover_model_1) { described_class.new(rover_1, plateau) }
    subject(:rover_model_2) { described_class.new(rover_2, plateau) }
    subject(:rover_model_3) { described_class.new(rover_3, plateau) }
    subject(:rover_model_4) { described_class.new(rover_4, plateau) }


    it 'raises error if rover does not lie within plateau is less than 1' do
      expect{ rover_model_1 }.to raise_error "Rover has not landed on plateau"
    end

    it 'raises error if rover x coordinate is greater than plateau x coordinate' do
      expect{ rover_model_2 }.to raise_error "Rover has not landed on plateau"
    end

    it 'raises error if rover y coordinate is greater than plateau y coordinate' do
      expect{ rover_model_3 }.to raise_error "Rover has not landed on plateau"
    end

    it 'raises error if rover x and y coordinate is greater than plateau x and y coordinate' do
      expect{ rover_model_4 }.to raise_error "Rover has not landed on plateau"
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
