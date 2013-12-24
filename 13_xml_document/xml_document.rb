class XmlDocument

  def initialize(indent = false)
    @indent = indent
    @indentation = 0
    @tag = ""
  end

  def method_missing(method, *args, &block)
    tag = ""
    starting_indentation = (@indentation - 2) < 0 ? 0 : 2
    add(tag, "<#{method}", false, starting_indentation)
    attributes = args[0]
    if attributes.is_a?(Hash)
      attributes.each { |name, value| tag << " #{name}='#{value}'" }
    end
    if block.nil?
      tag << "/>"
    else
      tag << ">"
      tag << "\n" if @indent
      @indentation += 2 if @indent
      result = block.call
      @indentation -=2 if @indent
      add(tag, result, true)
      add(tag, "</#{method}>", false)
    end
    tag
  end

  def add(text, suffix, newline = false, indent = nil)
    indentation = @indent ? indent || @indentation : 0
    text << (" " * indentation) << suffix
    text << "\n" if @indent && newline
  end

end
