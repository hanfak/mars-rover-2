describe Plateau do
  subject(:plateau) { described_class.new(5, 9)}
  subject(:default_plateau) { described_class.new }

  describe 'instantiation' do
    it 'create a plateau of size x' do
      expect(plateau.max_x).to eq 5
    end

    it 'create a plateau of size y' do
      expect(plateau.max_y).to eq 9
    end

    describe 'raise exception if coordinates are out of bounds' do
      it 'x out of bounds' do
        expect { Plateau.new(-1, 5) }.to raise_error "Coordinate size is non-positive: Choose positive coordinates"
      end

      it 'y out of bounds' do
        expect { Plateau.new(1, 0) }.to raise_error "Coordinate size is non-positive: Choose positive coordinates"
      end

      it 'x and y out of bounds' do
        expect { Plateau.new(0, -3) }.to raise_error "Coordinate size is non-positive: Choose positive coordinates"
      end
    end

    it 'has a default plateau size of 5 by 5' do
      expect(default_plateau.max_x).to eq 5
      expect(default_plateau.max_y).to eq 5
    end
  end
end
