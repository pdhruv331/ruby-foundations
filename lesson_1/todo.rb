require 'pry'
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    if task.class == Todo
      self.todos << task
    else
      raise TypeError
    end
    todos
  end

  def <<(task)
    if task.class == Todo
      self.todos << task
    else
      raise TypeError
    end
    todos
  end

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[size-1]
  end

  def item_at(index)
    raise IndexError if index > size
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index > size
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index > size
    todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end
  
  def remove_at(index)
    raise IndexError if index > size
    todos.delete(item_at(index))
  end

  def to_a
    @todos
  end

  def each
     todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(title)
    each do |todo|
      result << todo if yield(todo)
    end

   result

  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def find_by_title(string)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(item)
    find_by_title(item).done! if find_by_title(item)
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
  
end



