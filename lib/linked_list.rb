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

end