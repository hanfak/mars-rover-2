describe Rover do
  let(:orientation) { double :orientation, direction: 'W', change_clockwise: nil}
  let(:landing_position) { double :position, get_position: '1 1' }

  subject(:rover) { described_class.new(orientation, landing_position) }

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
end
