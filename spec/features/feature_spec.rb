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

  # User Story 2
  #
  # As a mission controller,
  # So that I can explore Mars,
  # I would like to land a rover on the plateau of the planet
  it 'User Story 2: Land a rover on plateau' do
    plateau = Plateau.new(5, 9)
    landing_position = Position.new(1, 1)
    orientation = Orientation.new('W')
    rover = Rover.new(orientation, landing_position)
    rover_model = RoverModel.new(rover, plateau)

    expect(rover_model.get_location_vector).to eq "1 1 W"
  end

  # User Story 3
  #
  # As a rover driver,
  # So that I can explore the plateau,
  # I would like to turn the rover
  it "User Story 3: Rover can turn" do
    plateau = Plateau.new(5, 9)
    landing_position = Position.new(1, 1)
    orientation = Orientation.new('W')
    rover = Rover.new(orientation, landing_position)
    rover_model = RoverModel.new(rover, plateau)
    move_commands = MoveCommands.new('R')

    rover_model.instruct_to_move(move_commands)

    expect(rover_model.get_location_vector).to eq "1 1 N"
  end
end
