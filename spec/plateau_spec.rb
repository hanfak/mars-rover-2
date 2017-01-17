describe Plateau do
  subject(:plateau) { described_class.new(5, 9)}

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
end
