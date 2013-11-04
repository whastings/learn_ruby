class Array

  def sum
    inject(0) { |sum, element| sum + element }
  end

  def square
    map { |element| element**2 }
  end

  def square!
    squares = square
    clear.concat(squares)
  end

end
