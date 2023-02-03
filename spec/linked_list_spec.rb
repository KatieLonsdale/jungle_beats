require 'rspec'
require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  describe '#initialize' do
    it 'exists' do
      list = LinkedList.new
      
      expect(list).to be_instance_of(LinkedList)
    end
    
    it 'has no head when created' do
      list = LinkedList.new
      
      expect(list.head). to eq(nil)
    end
  end
  
  describe '::basic functionality' do
    it 'adds new data to list' do
      list = LinkedList.new

      list.append('doop')

      expect(list.append('doop')).to eq('doop')
      # will this run append twice?
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)
      expect(list.head).to be_instance_of(Node)
      # test it adds to the front?
    end

    it 'tells us how many nodes are in list' do
      list = LinkedList.new
      
      list.append('doop')
      
      expect(list.count).to eq 1

    end
    
    it 'returns 0 if there are no nodes yet' do
      list = LinkedList.new
      
      expect(list.count).to eq 0
      
    end
    
    it 'generates string of elements in list' do
      list = LinkedList.new
      
      list.append('doop')

      expect(list.to_string).to eq('doop')
    end

    it 'returns nil if there are no nodes yet' do
      list = LinkedList.new

      expect(list.to_string).to eq(nil)
    end

  end

  describe '::can have multiple nodes' do
    it 'can append another node' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')

      expect(list.head.next_node.data).to eq('deep')
      expect(list.head.next_node.next_node.data). to eq(nil)
    end

    it 'tells us how many nodes are in the list' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')

      expect(list.count). to eq 2
    end

    it 'generates string of elements in list' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')

      expect(list.to_string).to eq('doop deep')
    end
  end

end