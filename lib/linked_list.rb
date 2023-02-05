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

  def insert(position, sound)
    if @head == nil
      @head = Node.new(sound)
    else
      current_node_1 = @head
      position.times do
        current_node_1 = current_node_1.next_node
      end
      new_next_node = current_node_1

      iterations = position -= 1
      current_node_2 = @head
      iterations.times do
        current_node_2 = current_node_2.next_node
      end
      current_node_2.next_node = Node.new(sound)
      current_node_2.next_node.next_node = new_next_node
      # try to get both into one block
    end
    sound
  end

  def pop
    if @head == nil
      ''
    elsif @head.next_node == nil
      last_node = @head
      @head = nil
      last_node.data
    else 
      last_node = self.find_last_node
      current_node = @head
      until current_node.next_node == last_node
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      last_node.data
    end
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
      ''
    end
  end

  def find(position, number_of_elements)
    if self.count <= position
      nil
    else
      current_node = @head
      position.times do
        current_node = current_node.next_node
      end
      string_to_return = ''
      number_of_elements.times do
        string_to_return.concat("#{current_node.data} ")
        current_node = current_node.next_node
      end
      string_to_return.delete_suffix(' ')
    end
  end

  def includes?(sound)
    answer = nil
    if @head == nil
      false
    else
      iterations = self.count
      current_node = @head
      iterations.times do
        current_node.data == sound ? answer = true : nil
        current_node = current_node.next_node
      end
      answer == true ? true : false
    end
  end
  
  def find_last_node
    if @head == nil
      nil
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node
    end
  end
end