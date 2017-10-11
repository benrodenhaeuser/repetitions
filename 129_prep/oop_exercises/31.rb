class MyCar

  def self.gas_mileage(miles, gallons)
    miles / gallons
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(number)
    @speed += number
  end

  def brake
    @speed -= number
  end

  def shut_off
    @speed = 0
  end

  def current_speed
    @speed
  end

  def color
    @color
  end

  def color=(color)
    @color = color
  end

  def year
    @year
  end

  def spray_paint(color)
    @color = color
    # or: self.color = color
  end

  def to_s
    "Year: #{@year}, color: #{@color}, model: #{@model}"
  end
end
