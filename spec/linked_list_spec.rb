# at end = go back and change describe names based on categories

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

      expect(list.append('doop')).to eq('doop')
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)
      expect(list.head).to be_instance_of(Node)
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

      expect(list.to_string).to eq('')
    end

  end

  describe '::iteration 1 pt 2' do
    it 'can append another node' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')
      list.append('plop')

      expect(list.head.next_node.data).to eq('deep')
      expect(list.head.next_node.next_node.data).to eq('plop')
      expect(list.head.next_node.next_node.next_node).to eq (nil)
      expect(list.find_last_node.data).to eq('plop')
      expect(list.find_last_node.next_node).to eq (nil)
    end

    it 'tells us how many nodes are in the list' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')
      list.append('plop')

      expect(list.count). to eq 3
    end

    it 'generates string of elements in list' do
      list = LinkedList.new
      
      list.append('doop')
      list.append('deep')
      list.append('plop')

      expect(list.to_string).to eq('doop deep plop')
    end
  end

  describe '::iteration 2'do
    it 'adds nodes to front of list' do
      list = LinkedList.new
      
      list.append('plop')
      list.append('suu')
      list.prepend('dop')

      expect(list.count).to eq 3
      expect(list.head.data).to eq ('dop')
      expect(list.to_string).to eq('dop plop suu')
    end

    it 'inserts a node at a given position' do
      list = LinkedList.new
      
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(1, "woo")

      expect(list.count).to eq 4
      expect(list.to_string).to eq('dop woo plop suu')
      expect(list.head.next_node.data).to eq('woo')
      expect(list.head.next_node.next_node.data).to eq('plop')
    end

    it 'can find x elements at index positions' do
      list = LinkedList.new
        
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.find(2, 1)).to eq('shi')
      expect(list.find(1, 3)).to eq('woo shi shu')
      expect(list.find(7, 1)).to eq(nil)
    end

    it 'can search for a sound' do
      list = LinkedList.new
        
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.includes?('deep')).to be true 
      expect(list.includes?('dep')).to be false 
    end

    # it 'can remove the last element' do
  end


end