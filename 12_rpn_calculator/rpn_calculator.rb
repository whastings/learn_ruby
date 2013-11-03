class RPNCalculator

  attr_reader :value

  def initialize
    @numbers = []
  end

  def push(value)
    @numbers << value.to_f
  end

  def plus
    calculate(:+)
  end

  def minus
    calculate(:-)
  end

  def times
    calculate(:*)
  end

  def divide
    calculate(:/)
  end

  def tokens(text)
    tokens = text.split(/\s/)
    tokens.map! { |token| (token =~ /[0-9]+/) ? token.to_i : token.to_sym }
  end

  def evaluate(text)
    calculator = self.class.new
    tokens(text).each do |part|
      if part.is_a?(Numeric)
        calculator.push(part)
      else
        calculator.calculate(part)
      end
    end
    calculator.value
  end

  protected

  def calculate(operator)
    raise "calculator is empty" if @numbers.length < 2
    @value = @numbers.pop(2).inject(operator)
    @numbers << @value
  end

end
