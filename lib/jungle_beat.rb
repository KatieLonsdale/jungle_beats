class JungleBeat

  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(sound_string)
    sound = ''
    return_value = ''
    sound_string.each_char do |character|
      if character == ' '
        node = Node.new(sound)
        @list.append(node.data)
        sound = ''
        return_value = return_value.concat("#{character}")
      else
        sound = sound.concat("#{character}")
        return_value = return_value.concat("#{character}")
      end
    end
    node = Node.new(sound)
    @list.append(node.data)
    return_value
  end

  def count
    list.count
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end