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

  describe '#change_clockwise' do
    it 'W to N' do
      orientation = Orientation.new('W')

      orientation.change_clockwise

      expect(orientation.direction).to eq 'N'
    end

    it 'N to E' do
      orientation = Orientation.new('N')

      orientation.change_clockwise

      expect(orientation.direction).to eq 'E'
    end

    it 'E to S' do
      orientation = Orientation.new('E')

      orientation.change_clockwise

      expect(orientation.direction).to eq 'S'
    end

    it 'S to W' do
      orientation = Orientation.new('S')

      orientation.change_clockwise

      expect(orientation.direction).to eq 'W'
    end
  end

  describe '#change_anticlockwise' do
    it 'N to W' do
      orientation = Orientation.new('N')

      orientation.change_anti_clockwise

      expect(orientation.direction).to eq 'W'
    end

    it 'E to N' do
      orientation = Orientation.new('E')

      orientation.change_anti_clockwise

      expect(orientation.direction).to eq 'N'
    end

    it 'S to E' do
      orientation = Orientation.new('S')

      orientation.change_anti_clockwise

      expect(orientation.direction).to eq 'E'
    end

    it 'W to S' do
      orientation = Orientation.new('W')

      orientation.change_anti_clockwise

      expect(orientation.direction).to eq 'S'
    end
  end
end
