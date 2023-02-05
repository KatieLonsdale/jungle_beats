class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(sound_string)
    sound = ''
    sound_string.each_char do |character|
      if character == ' '
        @list.append(sound)
        sound = ''
      else
        sound = sound.concat("#{character}")
      end
    end
    @list.append(sound)
    sound_string
  end

  def count
    list.count
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end