def reverser
  text = yield
  words = text.split(/\s/)
  words.map! { |word| word.reverse }
  words.join(' ')
end

def adder(to_add = 1, &num_getter)
  num = num_getter.call
  num + to_add
end

def repeater(iterations = 1)
  iterations.times { yield }
end
