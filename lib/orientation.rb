class Orientation
  attr_reader :direction

  def initialize(direction)
    @direction = check_direction(direction) || direction
  end

  private
    def check_direction(direction)
      unless ['N','S','E','W'].include? direction
        raise "Not a direction"
      end
    end
end
