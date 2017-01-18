class Rover
  attr_reader :orientation, :landing_position

  def initialize(orientation, landing_position)
    @orientation = orientation
    @landing_position = landing_position
  end
end
