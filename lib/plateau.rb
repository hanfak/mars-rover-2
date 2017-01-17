class Plateau
  attr_reader :max_x, :max_y

  def initialize(max_x, max_y)
    @max_x = check_size(max_x) || max_x
    @max_y = check_size(max_y) || max_y
  end

  private
    def check_size coordinate
      if coordinate < 1
        raise "Coordinate size is non-positive: Choose positive coordinates"
      end
    end
end
