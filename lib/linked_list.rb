class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(sound)
    @head = Node.new(sound)
    sound
  end

end