describe Plateau do
  it 'create a plateau of size x' do
    plateau = Plateau.new(5, 9)

    expect(plateau.max_x).to eq 5
  end

  it 'create a plateau of size y' do
    plateau = Plateau.new(5, 9)

    expect(plateau.max_y).to eq 9
  end
end
