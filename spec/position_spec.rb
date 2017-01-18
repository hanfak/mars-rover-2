describe Position do
  subject(:position) { described_class.new(1,3) }
  describe "instantiation" do
    it 'has an x coordinate' do
      expect(position.x_coordinate).to eq 1
    end

    it 'has an y coordinate' do
      expect(position.y_coordinate).to eq 3
    end
  end
end
