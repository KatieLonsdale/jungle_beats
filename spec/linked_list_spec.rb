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

  describe '#append' do
    it 'adds new nodes to end of list' do
      list = LinkedList.new
      
      list.append('doop')

      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)
      expect(list.head).to be_instance_of(Node)
    
      list.append('deep')
      list.append('plop')
      
      expect(list.head.next_node.data).to eq('deep')
      expect(list.head.next_node.next_node.data).to eq('plop')
      expect(list.head.next_node.next_node.next_node).to eq (nil)
      expect(list.find_last_node.data).to eq('plop')
      expect(list.find_last_node.next_node).to eq (nil)
    end
  end

  describe '#prepend' do
    it 'adds new nodes to front of list' do
      list = LinkedList.new
      
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      
      expect(list.count).to eq 3
      expect(list.head.data).to eq ('dop')
      expect(list.to_string).to eq('dop plop suu')
    end
  end

  describe '#insert' do
    it 'adds a node at a given position' do
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

    it 'returns error message if position does not exist' do
      list = LinkedList.new
      
      list.append('plop')
      list.append('suu')
      
      expect(list.insert(3, "woo")).to eq('Error: Position does not exist. Please choose an index position 0-2.')
    end

  end

  describe '#pop' do
    it 'removes the last node' do
      list = LinkedList.new
      
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
      
      list.pop 
      list.pop
      
      expect(list.to_string).to eq('deep woo shi')
    end

    it 'returns error message if list empty' do
      list = LinkedList.new
        
      expect(list.pop).to eq('Error: list is empty.')
      expect(list.to_string).to eq('')
      
      list.append('deep')
      list.append('woo')
      
      list.pop
      list.pop
      
      expect(list.pop).to eq('Error: list is empty.')
      expect(list.to_string).to eq('')
    end
  end

  describe '#count' do
    it 'tells us how many nodes are in list' do
      list = LinkedList.new
      
      list.append('doop')
      
      expect(list.count).to eq 1
      
      list.append('deep')
      list.append('plop')
      
      expect(list.count). to eq 3
    end

    it 'returns 0 if there are no nodes' do
      list = LinkedList.new
      
      expect(list.count).to eq 0
    end
  end

  describe '#to_string' do
    it 'returns string of nodes in list' do
      list = LinkedList.new
      
      list.append('doop')
      
      expect(list.to_string).to eq('doop')

      list.append('deep')
      list.append('plop')
      
      expect(list.to_string).to eq('doop deep plop')
    end

    it 'returns empty string if there are no nodes' do
      list = LinkedList.new
      
      expect(list.to_string).to eq('')
    end
  end

  describe '#find' do
    it 'finds given number of nodes at given position' do
      list = LinkedList.new
      
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
      
      expect(list.find(2, 1)).to eq('shi')
      expect(list.find(1, 3)).to eq('woo shi shu')
    end

    it 'returns error message if given position does not exit' do
      list = LinkedList.new
      
      list.append('deep')
      list.append('woo')
      list.append('shi')

      expect(list.find(7, 1)).to eq('Error: Position does not exist. Please choose an index position 0-2.')
    end

    it 'returns error message if not enough nodes to return'do
      list = LinkedList.new
        
      list.append('deep')
      list.append('woo')
      list.append('shi')

      expect(list.find(1, 3)).to eq('Error: Not enough sounds to return.')
    end
  end

  describe '#includes?' do
    it 'can search for a sound' do
      list = LinkedList.new
      
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
      
      expect(list.includes?('deep')).to be true 
    end

    it 'returns false if sound does not exist' do
      list = LinkedList.new
        
      list.append('deep')
      list.append('woo')
      list.append('shi')

      expect(list.includes?('dep')).to be false 
    end
  end

  describe '#find_last_node' do
    it 'returns last node in list'do
      list = LinkedList.new
          
      list.append('deep')
      list.append('woo')
      list.append('shi')

      expect(list.find_last_node.data).to eq('shi')
    end

    it 'returns error if list empty' do
      list = LinkedList.new

      expect(list.find_last_node).to eq('Error: empty list.')
    end
  end

  describe '#check_for_sound' do
    it 'only appends valid sounds' do
      list = LinkedList.new

      list.append('deep')
      # list.append('Mississippi')

      expect(list.append('Mississippi')).to eq('Error: Not a valid sound.')

    end
  end
  
end