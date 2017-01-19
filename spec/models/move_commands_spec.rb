describe MoveCommands do
  describe 'instantiation' do
    it 'has an instruction' do
      move_commands = MoveCommands.new('R')

      expect(move_commands.instructions).to eq ['R']
    end
  end

  describe '#instructions' do
    it 'turns string into an array' do
      move_commands = MoveCommands.new('RLM')

      expect(move_commands.instructions).to eq ['R', 'L', 'M']
    end
  end
end
