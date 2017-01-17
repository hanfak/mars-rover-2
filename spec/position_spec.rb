describe Position do
  describe "instantiation" do
    it 'has an x coordinate' do
      position = Position.new(1, 3)

      expect(position.x_coordinate).to eq 1
    end

    it 'has an y coordinate' do
      position = Position.new(1, 3)

      expect(position.y_coordinate).to eq 3
    end
  end
end
