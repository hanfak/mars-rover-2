describe Position do
  subject(:position) { described_class.new(1,3) }

  describe "instantiation" do
    it 'has the following 2D coordinates' do
      expect(position.get_position).to eq "1 3"
    end
  end
end
