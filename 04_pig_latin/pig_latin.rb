
def translate(text)
  words = text.split(/\s/)
  words.each do |word|
    first_char = word.chr
    next word << 'ay' if first_char.match(/[aeiou]/i)
    consonants = word.slice!(/^y?(?:[^aeiouy]|(?<=q)u)+/i)
    punctuation = word.slice!(/[,\.;]$/)
    word << consonants.downcase << 'ay'
    word.capitalize! if first_char.match(/[A-Z]/)
    word << punctuation unless punctuation.nil?
  end
  words.join(' ')
end
