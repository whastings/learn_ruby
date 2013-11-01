def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, repeats = 2)
  response = []
  repeats.times { response << text }
  response.join(' ')
end

def start_of_word(text, length)
  text[0..(length - 1)]
end

def first_word(text)
  text.split(/\s/).shift
end

def titleize(text)
  words = text.split(/\s/)
  words.each_with_index do |word, index|
    unless LITTLE_WORDS.include?(word.downcase) && (index > 0)
      #word.capitalize! # Too easy...
      first_char = word.chr.upcase
      word.sub!(/^(.)/, first_char)
    end
  end
  words.join(' ')
end

LITTLE_WORDS = [
  'and',
  'but',
  'or',
  'over',
  'still',
  'the'
]
