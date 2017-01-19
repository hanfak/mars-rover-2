describe 'User Stories' do

  # User Story 1
  #
  # As a mission controller,
  # So that I know where to send my rovers to explore,
  # I would like to have a plateau mapped out
  it 'User Story 1: Create plateau' do
    plateau = Plateau.new(5, 9)
    number_of_positions = (plateau.max_x + 1) * (plateau.max_y + 1)

    expect(number_of_positions).to eq 60
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
  context 'User Story 3' do
    it "Rover can turn right" do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('W')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('R')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "1 1 N"
    end

    it "Rover can turn left" do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('W')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('L')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "1 1 S"
    end
  end

  # User Story 4
  #
  # As a rover driver,
  # So that I can explore the plateau,
  # I would like to move the rover in the direction it is facing
  context 'User Story 4' do
    it 'Rover can move west' do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('W')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('M')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "0 1 W"
    end

    it 'Rover can move east' do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('E')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('M')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "2 1 E"
    end

    it 'Rover can move North' do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('N')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('M')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "1 2 N"
    end

    it 'Rover can move South' do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 1)
      orientation = Orientation.new('S')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('M')

      rover_model.instruct_to_move(move_commands)

      expect(rover_model.get_location_vector).to eq "1 0 S"
    end

    it 'Rover moves off the board' do
      plateau = Plateau.new(5, 9)
      landing_position = Position.new(1, 0)
      orientation = Orientation.new('S')
      rover = Rover.new(orientation, landing_position)
      rover_model = RoverModel.new(rover, plateau)
      move_commands = MoveCommands.new('M')

      expect { rover_model.instruct_to_move(move_commands) }.to raise_error "Rover is not on plateau"
    end
  end
end
