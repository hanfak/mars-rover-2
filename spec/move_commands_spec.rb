describe MoveCommands do
  describe 'instantiation' do
    it 'has an instruction' do
      move_commands = MoveCommands.new('R')
      expect(move_commands.instructions).to eq 'R'
    end
  end
end
