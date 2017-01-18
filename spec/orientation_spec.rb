describe Orientation do
  describe "instantiation" do
    it 'has an orientation' do
      orientation = Orientation.new('W')

      expect(orientation.direction).to eq 'W'
    end

    xit 'can only have four directions'
    xit 'raises error if direction is not a compass point'
  end
end
