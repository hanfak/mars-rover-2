describe MissionControl do

  describe 'instantation' do
    subject(:mission_control) { described_class }

    it 'initialized with a rover model' do
      expect(mission_control.new(RoverModel)).to be_a described_class
    end
  end

  describe '#activate_rovers' do
    subject(:mission_control) { described_class.new(RoverModel) }

    it 'takes instructions and implements business logic' do
      instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"

      actual = mission_control.activate_rovers(instructions)

      expect(actual).to eq "1 3 N\n5 1 E"
    end

    it 'rescues error' do
      instructions = "5 5\n0 0 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"

      actual = mission_control.activate_rovers(instructions)

      expect(actual).to eq "Rover is not on plateau\n5 1 E"
    end
  end
end
