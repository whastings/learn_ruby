# Converts Fahrenheit to Celsius.
def ftoc(degrees_f)
  (degrees_f - 32.0) * 5.0 / 9.0
end

# Converts Celius to Fahrenheit.
def ctof(degrees_c)
  (degrees_c) / (5.0 / 9.0) + 32.0
end
