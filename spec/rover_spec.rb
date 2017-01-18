describe Rover do
  let(:orientation) { double :orientation, direction: 'W'}
  let(:landing_position) { double :position, get_position: '1 1' }

  subject(:rover) { described_class.new(orientation, landing_position) }
  
  describe 'instantiation' do
    it 'has an orientation when landing' do
      expect(rover.orientation.direction).to eq 'W'
    end

    it 'has a position when landing' do
      expect(rover.landing_position.get_position).to eq '1 1'
    end
  end
end
