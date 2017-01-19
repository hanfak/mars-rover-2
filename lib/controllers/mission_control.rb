class MissionControl
  def initialize(rover_klass)
    @rover_klass = rover_klass
  end

  def activate_rovers(instructions)
    instructions_details = instructions.split("\n")
    plateau_size = instructions_details.shift.split
    plateau = Plateau.new(plateau_size[0].to_i, plateau_size[1].to_i)
    results = []
    instructions_details.each_slice(2) do |robot_instructions|
      robot_landing = robot_instructions[0].split
      robot_position =  robot_landing[0..1].map(&:to_i)

      landing_position = Position.new(robot_position[0], robot_position[1])
      orientation = Orientation.new(robot_landing.last)
      rover = Rover.new(orientation, landing_position)

      rover_model = rover_klass.new(rover, plateau)

      robot_commands = MoveCommands.new(robot_instructions[1])
      rover_model.instruct_to_move(robot_commands)

      results << rover_model.get_location_vector
    end

    results.join("\n")
  end

  private
    attr_reader :rover_klass
end
