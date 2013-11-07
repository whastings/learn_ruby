class Fixnum

  ONES = {
    0 => '',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine'
  }

  TENS = {
    0 => '',
    1 => 'ten',
    2 => 'twenty',
    3 => 'thirty',
    4 => 'forty',
    5 => 'fifty',
    6 => 'sixty',
    7 => 'seventy',
    8 => 'eighty',
    9 => 'ninety'
  }

  TEENS = {
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  ORDERS = ['thousand', 'million', 'billion', 'trillion']

  def in_words
    return "zero" if self == 0
    return TEENS[self] if self > 10 && self < 20
    # Break up number into three digit parts.
    parts, string_num = [], to_s
    until string_num.length < 3
      parts << string_num.slice!(-3, 3)
    end
    parts << string_num unless string_num.empty?
    # Turn each part into words.
    parts.map! { |part| process_part(part) }
    parts.each_with_index do |part, index|
      next if index == 0 || part.empty?
      part << ' ' + ORDERS[index - 1]
    end
    parts.delete_if { |part| part.empty? }
    parts.reverse.join(' ').strip
  end

  # Converts small numbers (0 - 999) to words.
  def process_part(number)
    number, words = number.to_i, []
    tens = (number % 100)
    if tens > 10 && tens < 20
      words << TEENS[tens]
      number /= 100
    else
      words << ONES[number % 10] if number >= 1
      number /= 10
      words << TENS[number % 10] if number >= 1
      number /= 10
    end
    words << (ONES[number % 10] + ' hundred') if number >= 1
    words.delete_if { |word| word.empty? }
    words.reverse.join(' ').strip
  end

end
