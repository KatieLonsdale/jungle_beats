class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(sound)
    if @head == nil
      @head = Node.new(sound) 
      sound
    else
      self.find_last_node.next_node = Node.new(sound)
      sound
    end
  end

  def find_last_node
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node
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
        array.push(current_node.data)
        current_node = current_node.next_node
      end
      array.push(current_node.data)
      array.join(' ')
    else
      nil
    end
  end

end