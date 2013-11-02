class Book

  NO_CAP_WORDS = [
    'the',
    'a',
    'and',
    'or',
    'an',
    'in',
    'of'
  ]

  def title=(title)
    words = title.split(/\s/)
    words.each_with_index do |word, index|
      word.capitalize! unless NO_CAP_WORDS.include?(word) && (index > 0)
    end
    @title = words.join(' ')
  end

  def title
    @title
  end

end
