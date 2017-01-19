class RoverModel
  def initialize(rover, plateau)
    @rover = check_rover_lies_on_plateau(rover, plateau) || rover
    @plateau = plateau
  end

  def get_location_vector
    rover.get_current_position + " " + rover.get_current_direction
  end

  def instruct_to_move(commands)
    commands.instructions.each do |command|
      rover.turn_right if command == 'R'
      rover.turn_left if command == 'L'
      rover.move_forward if command == 'M'
      check_rover_lies_on_plateau(rover, plateau)
    end
  end

  private
    attr_reader :rover, :plateau

    def check_rover_lies_on_plateau(rover, plateau)
      rover_x_coord, rover_y_coord = rover.get_current_position.split.map(&:to_i)
      unless rover_x_coord <= plateau.max_x &&
        rover_y_coord <= plateau.max_y &&
        rover_x_coord > -1 &&
        rover_y_coord > -1
        raise "Rover is not on plateau"
      end
    end
end
