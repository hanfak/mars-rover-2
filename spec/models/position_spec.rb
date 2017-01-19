describe Position do
  subject(:position) { described_class.new(1,3) }

  describe "instantiation" do
    it 'has the following 2D coordinates' do
      expect(position.get_position).to eq "1 3"
    end
  end

  describe "#set_x" do
    it 'move left along x axis one position' do
      position.set_x(-1)

      expect(position.get_position).to eq '0 3'
    end

    it 'move right along x axis one position' do
      position.set_x(1)

      expect(position.get_position).to eq '2 3'
    end

    it 'raises error if argument is not 1 or -1' do
      expect { position.set_x(5) }.to raise_error 'Can only change by unit amount'
    end
  end

  describe "#set_y" do
    it 'move left along y axis one position' do
      position.set_y(1)

      expect(position.get_position).to eq '1 4'
    end

    it 'move right along x axis one position' do
      position.set_y(-1)

      expect(position.get_position).to eq '1 2'
    end

    it 'raises error if argument is not 1 or -1' do
      expect { position.set_y(-2) }.to raise_error 'Can only change by unit amount'
    end
  end
end
