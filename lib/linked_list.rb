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

  def prepend(sound)
    if @head == nil
      @head = Node.new(sound)
    else
      new_head = Node.new(sound)
      new_head.next_node = @head
      @head = new_head
    end
    sound
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
      string = ''
      current_node = @head
      until current_node.next_node == nil
        string.concat("#{current_node.data} ")
        current_node = current_node.next_node
      end
      string.concat("#{current_node.data}")
      string
    else
      nil
    end
  end

end