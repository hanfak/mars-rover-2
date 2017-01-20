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
      expect{ rover_model_1 }.to raise_error "Rover is not on plateau"
    end

    let(:rover_2) { double :rover, get_current_direction: 'W', get_current_position: '6 3' }
    subject(:rover_model_2) { described_class.new(rover_2, plateau) }

    it 'raises error if rover x coordinate is greater than plateau x coordinate' do
      expect{ rover_model_2 }.to raise_error "Rover is not on plateau"
    end

    let(:rover_3) { double :rover, get_current_direction: 'W', get_current_position: '5 9' }
    subject(:rover_model_3) { described_class.new(rover_3, plateau) }

    it 'raises error if rover y coordinate is greater than plateau y coordinate' do
      expect{ rover_model_3 }.to raise_error "Rover is not on plateau"
    end

    let(:rover_4) { double :rover, get_current_direction: 'W', get_current_position: '8 8' }
    subject(:rover_model_4) { described_class.new(rover_4, plateau) }

    it 'raises error if rover x and y coordinate is greater than plateau x and y coordinate' do
      expect{ rover_model_4 }.to raise_error "Rover is not on plateau"
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
    let(:move_command_turn_right) { double :move_commands, instructions: ['R'] }

    it 'asks rover to turn right' do
      expect(rover).to receive(:turn_right)
      rover_model.instruct_to_move(move_command_turn_right)
    end

    let(:move_command_turn_left) { double :move_commands, instructions: ['L'] }

    it 'asks rover to turn left' do
      expect(rover).to receive(:turn_left)
      rover_model.instruct_to_move(move_command_turn_left)
    end

    let(:move_command_forward) { double :move_commands, instructions: ['M'] }

    it 'asks rover to move forward' do
      expect(rover).to receive(:move_forward)
      rover_model.instruct_to_move(move_command_forward)
    end

    context 'rover goes off plateau' do
      let(:rover_5) { double :rover, get_current_direction: 'W', get_current_position: '0 3', move_forward: nil }
      subject(:rover_model_5) { described_class.new(rover_5, plateau) }

      it 'raises error when rover moves off plateau at zero edge' do
        allow(rover_5).to receive(:get_current_position).and_return('-1 3')
        expect do
          rover_model_5.instruct_to_move(move_command_forward)
        end.to raise_error "Rover is not on plateau"
      end

      let(:rover_6) { double :rover, get_current_direction: 'W', get_current_position: '5 3', move_forward: nil }
      subject(:rover_model_6) { described_class.new(rover_6, plateau) }

      it 'raises error when rover moves off plateau at max coordinate edge' do
        allow(rover_6).to receive(:get_current_position).and_return('6 3')
        expect do
          rover_model_6.instruct_to_move(move_command_forward)
        end.to raise_error "Rover is not on plateau"
      end
    end

  end
end
