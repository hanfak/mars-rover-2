describe 'User Stories' do

  # User Story 1
  #
  # As a mission controller,
  # So that I know where to send my rovers to explore,
  # I would like to have a plateau mapped out
  it 'User Story 1: Create plateau' do
    plateau = Plateau.new(5, 9)
    number_of_positions = plateau.max_x * plateau.max_y

    expect(number_of_positions).to eq 45
  end
end
