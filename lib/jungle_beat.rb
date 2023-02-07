class JungleBeat
  attr_reader :list, :sound_string
  attr_accessor :rate, :voice

  def initialize(sound_string = nil)
    @list = LinkedList.new
    @sound_string = sound_string
      self.append(sound_string) if @sound_string
    @rate = 500
    @voice = 'Boing'
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

  def prepend(sound_string)
    sound = ''
    inserted_beats = 0
    sound_string.reverse!.each_char do |character|
      if character == ' '
        result = @list.prepend(sound)
          if result == sound
            inserted_beats += 1
          else
          end
        sound = ''
      else
        sound = sound.prepend("#{character}")
      end
    end
    result = @list.prepend(sound)
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
    if list.to_string != ''
      `say -r #{@rate} -v #{@voice} #{list.to_string}`
      self.count
    else
    end
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Boing'
  end

end