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
  end

  describe ':iteration 3' do
    it 'appends multiple nodes at once' do
      jb = JungleBeat.new

      jb.append('deep doo ditt')

      expect(jb.list.to_string).to eq('deep doo ditt')
      expect(jb.list.head.data).to eq('deep')
      expect(jb.list.head.next_node.data).to eq('doo')
    end

  end
end