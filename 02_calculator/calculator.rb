def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(numbers)
  numbers.inject { |sum, number| sum + number } || 0
end

def multiply(*numbers)
  numbers.inject { |product, number| product * number } || 0
end

def power(base, exponent)
  result = 1
  exponent.times { result *= base }
  result
end

def factorial(number)
  (number > 0) ? multiply(*(1..number).to_a) : 1
end
