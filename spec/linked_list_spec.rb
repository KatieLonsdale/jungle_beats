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
  
  describe '::add new nodes' do
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

    # it 'returns the next node' do
    #   list = LinkedList.new

    #   list.append('doop')

    #   expect(list.head.next_node).to eq(nil)
    # end
  end

end