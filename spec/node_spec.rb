require 'rspec'
require './lib/node'

RSpec.describe Node do
  describe '#initialize' do
    it 'exists' do
      node = Node.new('plop')

      expect(node).to be_instance_of(Node)
    end

    it 'has a sound' do
      node = Node.new('plop')

      expect(node.data).to eq('plop')
    end

    it 'has no next node at creation' do
      node = Node.new('plop')

      expect(node.next_node).to eq(nil)
    end
  end
end