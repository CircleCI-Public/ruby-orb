require 'tagged'

RSpec.describe Tagged, :tagged do
  describe '#test' do
    it 'returns string' do
      expect(described_class.new.test).to eq('I am tagged')
    end
  end
end
