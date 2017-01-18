describe Orientation do
  describe "instantiation" do
    it 'can have a West direction ' do
      orientation = Orientation.new('W')

      expect(orientation.direction).to eq 'W'
    end

    it 'can have a North direction' do
      orientation = Orientation.new('N')

      expect(orientation.direction).to eq 'N'
    end

    it 'can have an East direction' do
      orientation = Orientation.new('E')

      expect(orientation.direction).to eq 'E'
    end

    it 'can have a South direction' do
      orientation = Orientation.new('S')

      expect(orientation.direction).to eq 'S'
    end

    it 'raises error if direction is not a compass point' do
        expect { Orientation.new('K') }.to  raise_error "Not a direction"
    end
  end
end
