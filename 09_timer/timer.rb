class Timer

  SECONDS_IN_HOUR = 3600
  SECONDS_IN_MINUTE = 60

  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    seconds = @seconds
    hours = seconds / SECONDS_IN_HOUR
    seconds -= hours * SECONDS_IN_HOUR
    minutes = seconds / SECONDS_IN_MINUTE
    seconds -= minutes * SECONDS_IN_MINUTE
    [hours, minutes, seconds].map { |time| padded(time) }.join(':')
  end

  def padded(number)
    number.to_s.rjust(2, '0')
  end

end
