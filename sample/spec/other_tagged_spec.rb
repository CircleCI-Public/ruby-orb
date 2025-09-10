require 'other_tagged'

RSpec.describe OtherTagged, :other_tagged do
  describe '#test' do
    it 'returns string' do
      expect(described_class.new.test).to eq('I am another tagged test')
    end
  end
end
