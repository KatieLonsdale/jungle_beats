class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(sound)
    @head = Node.new(sound) 
    sound
  end

  def count
    if @head != nil
      count = 1
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
        count += 1
      end
      count
    else
      0
    end
  end

  def to_string
    if @head != nil
      array = []
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
        array.push(current_node.data)
      end
      array.push(current_node.data)
      array.join(' ')
    else
      nil
    end
  end

end