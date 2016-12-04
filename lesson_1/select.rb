def select(array)
  counter = 0
  while counter < array.size
    if yield(array[counter])
      array[counter] = array[counter]
    else
      array.delete(array[counter])
      counter -= 1
    end
    counter += 1
  end
  array
end


array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

 p select(array) { |num| num.odd? }      # => [1, 3, 5]
 p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true