class Dictionary

  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(element)
    if element.is_a?(Hash)
      @entries.merge!(element)
    else
      @entries[element] = nil
    end
  end

  def keywords
    @entries.keys.sort!
  end

  def include?(key)
    @entries.has_key?(key)
  end

  def find(search_key)
    find = @entries[search_key]
    unless find
      find = @entries.select do |key, value|
        key.is_a?(String) && key =~ /^#{Regexp.quote(search_key)}/
      end
      return find
    end
    result = {}
    result[search_key] = find
    result
  end

  def printable
    lines = []
    @entries.sort.each { |key, value| lines << %Q{[#{key}] "#{value}"} }
    lines.join("\n")
  end

end
