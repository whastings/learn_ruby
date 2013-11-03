class Temperature

  def initialize(options)
    degrees_c = options[:celcius] || options[:c]
    degrees_f = options[:fahrenheit] || options[:f]
    if degrees_c
      @temperature, @system = degrees_c, :celcius
    elsif degrees_f
      @temperature, @system = degrees_f, :fahrenheit
    else
      raise ArgumentError, "No temperature given."
    end
  end

  def in_celsius
    return @temperature if @system == :celcius
    self.class.ftoc(@temperature)
  end

  def in_fahrenheit
    return @temperature if @system == :fahrenheit
    self.class.ctof(@temperature)
  end

  def self.from_celsius(temperature)
    self.new(celcius: temperature)
  end

  def self.from_fahrenheit(temperature)
    self.new(fahrenheit: temperature)
  end

  def self.ftoc(temperature)
    (temperature - 32.0) * (5.0 / 9.0)
  end

  def self.ctof(temperature)
    (temperature / (5.0 / 9.0)) + 32.0
  end

end

class Celsius < Temperature

  def initialize(temperature)
    super(celcius: temperature)
  end

end

class Fahrenheit < Temperature

  def initialize(temperature)
    super(fahrenheit: temperature)
  end

end
