require 'rspec'
require "./lib/linked_list"

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

end