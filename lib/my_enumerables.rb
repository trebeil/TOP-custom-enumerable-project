module Enumerable
  def my_each_with_index
    for i in 0..self.length-1
      yield self[i], i
    end
    self
  end

  def my_select
    selected = []
    for i in 0..self.length-1
      selected << self[i] if yield self[i]
    end
    selected
  end

  def my_all?
    for i in 0..self.length-1
      return false unless yield self[i]
    end
    true
  end

  def my_any?
    for i in 0..self.length-1
      return true if yield self[i]
    end
    false
  end

  def my_none?
    for i in 0..self.length-1
      return false if yield self[i]
    end
    true
  end

  def my_count
    counter = 0
    if block_given?
      for i in 0..self.length-1
        counter += 1 if yield self[i]
      end
      return counter
    end
    self.length
  end

  def my_map
    mapped = []
    for i in 0..self.length-1
      mapped.push(yield self[i])
    end
    mapped
  end

  def my_inject(initial_operand)
    operand = initial_operand
    for i in 0..self.length-1
      operand = yield operand, self[i]
    end
    operand
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in 0..self.length-1
      yield self[i]
    end
    self
  end
end
