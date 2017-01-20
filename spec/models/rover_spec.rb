describe Rover do
  let(:orientation) { double :orientation, direction: 'W', change_clockwise: nil, change_anti_clockwise: nil }
  let(:current_position) { double :position, get_position: '1 1' }

  subject(:rover) { described_class.new(orientation, current_position) }

  describe 'instantiation' do
    it 'has an orientation when landing' do
      expect(rover.get_current_direction).to eq 'W'
    end

    it 'has a position when landing' do
      expect(rover.get_current_position).to eq '1 1'
    end
  end

  describe '#turn_right' do
    it 'asks orientation to set direction clockwise' do
      expect(orientation).to receive(:change_clockwise)
      rover.turn_right
    end
  end

  describe '#turn_left' do
    it 'asks orientation to set direction anti clockwise' do
      expect(orientation).to receive(:change_anti_clockwise)
      rover.turn_left
    end
  end

  describe '#move_forward' do
    it 'changes position when facing west' do
      expect(current_position).to receive(:set_x).with(-1)
      rover.move_forward
    end

    let(:orientated_east) { double :orientation, direction: 'E' }
    subject(:rover_1) { described_class.new(orientated_east, current_position) }

    it 'changes position when facing east' do
      expect(current_position).to receive(:set_x).with(1)
      rover_1.move_forward
    end

    let(:orientated_north) { double :orientation, direction: 'N' }
    subject(:rover_2) { described_class.new(orientated_north, current_position) }

    it 'changes position when facing north' do
      expect(current_position).to receive(:set_y).with(1)
      rover_2.move_forward
    end

    let(:orientated_south) { double :orientation, direction: 'S' }
    subject(:rover_3) { described_class.new(orientated_south, current_position) }

    it 'changes position when facing west' do
      expect(current_position).to receive(:set_y).with(-1)
      rover_3.move_forward
    end
  end
end
