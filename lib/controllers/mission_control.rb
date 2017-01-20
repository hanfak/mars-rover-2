class MissionControl
  def initialize(rover_model_klass)
    @rover_model_klass = rover_model_klass
  end

  def activate_rovers(instructions)
    results = []

    command_details(instructions).each_slice(2) do |rover_instructions|
      rover_model = rover_model_klass.new(initialize_rover(rover_instructions), plateau_details(instructions))
      begin
        rover_model.instruct_to_move(rover_commands(rover_instructions))
      rescue Exception => e
        results << e
      else
        results << rover_model.get_location_vector
      end
    end

    results.join("\n")
  end

  private
    attr_reader :rover_model_klass

    def plateau_details(instructions)
      instructions_details = instructions.split("\n")
      plateau_size = instructions_details.first.split
      Plateau.new(plateau_size[0].to_i, plateau_size[1].to_i)
    end

    def command_details(instructions)
      instructions.split("\n")[1..-1]
    end

    def initialize_rover(rover_instructions)
      rover_landing = rover_instructions[0].split
      rover_position =  rover_landing[0..1].map(&:to_i)

      landing_position = Position.new(rover_position[0], rover_position[1])
      orientation = Orientation.new(rover_landing.last)
      Rover.new(orientation, landing_position)
    end

    def rover_commands(rover_instructions)
      MoveCommands.new(rover_instructions[1])
    end
end
