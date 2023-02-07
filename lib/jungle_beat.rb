class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(sound_string)
    sound = ''
    inserted_beats = 0
    sound_string.each_char do |character|
      if character == ' '
        result = @list.append(sound)
          if result == sound
            inserted_beats += 1
          else
          end
        sound = ''
      else
        sound = sound.concat("#{character}")
      end
    end
    result = @list.append(sound)
      if result == sound
        inserted_beats += 1
      else
      end
    inserted_beats
  end

  def count
    list.count
  end

  def all
    list.to_string
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

end