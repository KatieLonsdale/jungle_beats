class JungleBeat

  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(sound_string)
    sound = ''
    sound_string.each_char do |character|
      if character == ' '
        node = Node.new(sound)
        @list.append(node.data)
        sound = ''
      else
        sound = sound.concat("#{character}")
      end
    end
    node = Node.new(sound)
    @list.append(node.data)
    list.to_string
  end

end