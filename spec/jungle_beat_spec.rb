require 'rspec'
require "./lib/linked_list"
require "./lib/node"
require "./lib/jungle_beat"

RSpec.describe LinkedList do
  describe '#initialize' do
    it 'exists' do
      jb = JungleBeat.new

      expect(jb).to be_instance_of(JungleBeat)
    end

    it 'has a linked list'do
      jb = JungleBeat.new

      expect(jb.list).to be_instance_of(LinkedList)
      expect(jb.list.head).to be(nil)
    end
    # can accept an argument or not
  end

  describe '#append' do
    it 'appends multiple nodes at once' do
      jb = JungleBeat.new

      jb.append('deep doo ditt')

      expect(jb.list.to_string).to eq('deep doo ditt')
      expect(jb.list.head.data).to eq('deep')
      expect(jb.list.head.next_node.data).to eq('doo')

      jb.append('woo hoo shu')

      expect(jb.list.to_string).to eq('deep doo ditt woo hoo shu')
      expect(jb.list.head.data).to eq('deep')
      expect(jb.list.find_last_node.data).to eq('shu')
    end

    it 'returns number of successfully inserted sounds' do
      jb = JungleBeat.new

      expect(jb.append('deep doo ditt')).to eq 3
      expect(jb.append('Mississippi')).to eq 0
      expect(jb.all).to eq('deep doo ditt')
    end
  end

  describe '#prepend' do
    it 'adds multiple nodes to front of list' do
      jb = JungleBeat.new

      jb.append('woo hoo')
      jb.prepend('tee tee')
      # insert words in order?

      expect(jb.all).to eq('tee tee woo hoo')
    end

    it 'returns number of successfully inserted sounds' do
      jb = JungleBeat.new

      expect(jb.prepend('deep doo')).to eq 2
      expect(jb.prepend('not good words')).to eq 0
    end
  end

  describe '#count' do
    it 'counts list length' do
      jb = JungleBeat.new

      jb.append('deep doo ditt')

      expect(jb.count).to eq 3

      jb.append('woo hoo shu')

      expect(jb.count).to eq 6
    end
  end

  describe '#all' do
    it 'returns string of nodes in list' do
      jb = JungleBeat.new

      jb.append('deep doo ditt')
      
      expect(jb.all).to eq('deep doo ditt')
    end
  end

  describe '#play' do
    it 'plays the list' do
      jb = JungleBeat.new

      jb.append('deep doo ditt woo hoo shu')

      expect(jb.play).to eq 6
    end

    it 'allows you to set the rate' do
      jb = JungleBeat.new

      expect(jb.rate).to eq 500

      jb.rate = 100

      expect(jb.rate).to eq 100
    end

    it 'allows you to set the voice' do
      jb = JungleBeat.new

      expect(jb.voice).to eq('Boing')

      jb.voice = 'Daniel'

      expect(jb.voice).to eq('Daniel')
    end

    # test for if string is empty
  end

  describe '#reset_rate' do
    it 'resets rate to 500' do
      jb = JungleBeat.new

      expect(jb.rate).to eq 500

      jb.rate = 100
      
      expect(jb.rate).to eq 100

      jb.reset_rate
      
      expect(jb.rate).to eq 500
    end
  end

  describe '#reset_voice' do
    it 'resets the voice to Boing' do
      jb = JungleBeat.new

      expect(jb.voice).to eq('Boing')

      jb.voice = 'Daniel'

      expect(jb.voice).to eq('Daniel')

      jb.reset_voice

      expect(jb.voice).to eq('Boing')
    end
  end
end