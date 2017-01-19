describe RoverModel do
  let(:rover) { double :rover, get_current_direction: 'W', get_current_position: '1 1' }

  let(:plateau) { double :plateau, max_x: 5, max_y: 5 }

  subject(:rover_model) { described_class.new(rover, plateau) }

  describe 'instantiation' do

    subject(:rover_model_0) { described_class }

    it "is initialized with a rover and plateau" do
      expect(rover_model_0.new(rover, plateau)).to be_a described_class
    end

    let(:rover_1) { double :rover, get_current_direction: 'W', get_current_position: '-1 -1' }
    subject(:rover_model_1) { described_class.new(rover_1, plateau) }

    it 'raises error if rover does not lie within plateau is less than 1' do
      expect{ rover_model_1 }.to raise_error "Rover has not landed on plateau"
    end

    let(:rover_2) { double :rover, get_current_direction: 'W', get_current_position: '6 3' }
    subject(:rover_model_2) { described_class.new(rover_2, plateau) }

    it 'raises error if rover x coordinate is greater than plateau x coordinate' do
      expect{ rover_model_2 }.to raise_error "Rover has not landed on plateau"
    end

    let(:rover_3) { double :rover, get_current_direction: 'W', get_current_position: '5 9' }
    subject(:rover_model_3) { described_class.new(rover_3, plateau) }

    it 'raises error if rover y coordinate is greater than plateau y coordinate' do
      expect{ rover_model_3 }.to raise_error "Rover has not landed on plateau"
    end

    let(:rover_4) { double :rover, get_current_direction: 'W', get_current_position: '8 8' }
    subject(:rover_model_4) { described_class.new(rover_4, plateau) }

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

  describe '#instruct_to_move' do
    let(:move_commands) { double :move_commands, instructions: 'R'}

    it 'asks rover to turn right' do
      expect(rover).to receive(:turn_right)
      rover_model.instruct_to_move(move_commands)
    end
  end
end
