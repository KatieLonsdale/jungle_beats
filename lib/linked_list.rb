class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(sound)
    valid_sound = check_for_sound(sound)
    if valid_sound == true
      if !@head
        @head = Node.new(sound)
      else
        self.find_last_node.next_node = Node.new(sound)
      end
      sound
    else
      'Error: Not a valid sound.'
    end
  end

  def prepend(sound)
    if !@head
      @head = Node.new(sound)
    else
      new_head = Node.new(sound)
      new_head.next_node = @head
      @head = new_head
    end
    sound
  end

  def insert(position, sound)
    if !@head
      @head = Node.new(sound)
      sound
    elsif position > self.count
      "Error: Position does not exist. Please choose an index position 0-#{self.count}."
    else
      previous_node = nil
      following_node = @head
      position.times do
        previous_node = following_node
        following_node = following_node.next_node
      end
      new_node = Node.new(sound)
      previous_node.next_node = new_node
      new_node.next_node = following_node
      sound
    end
  end

  def pop
    if !@head
      'Error: list is empty.'
    elsif !@head.next_node
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
    if @head
      count = 1
      current_node = @head
      until !current_node.next_node
        count += 1
        current_node = current_node.next_node
      end
      count
    else
      0
    end
  end

  def to_string
    if @head
      string = ''
      current_node = @head
      until !current_node.next_node
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
      "Error: Position does not exist. Please choose an index position 0-#{self.count - 1}."
    elsif position + number_of_elements > self.count
      "Error: Not enough sounds to return."
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
    answer = false
    if !@head
      answer
    else
      iterations = self.count
      current_node = @head
      iterations.times do
        answer = true if current_node.data == sound
        current_node = current_node.next_node
      end
      answer == true ? true : false
    end
  end
  
  def find_last_node
    if !@head
      "Error: empty list."
    else
      current_node = @head
      until !current_node.next_node
        current_node = current_node.next_node
      end
      current_node
    end
  end

  def check_for_sound(sound)
    filename = 'iteration_4_beats.txt'
    valid_sound = false
    file = File.open(filename)
    File.foreach(filename) do |line|
      line.chomp!.to_s
      valid_sound = true if line == sound
    end
    file.close
    valid_sound
  end
end