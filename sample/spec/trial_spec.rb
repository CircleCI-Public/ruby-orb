require 'trial'

RSpec.describe Trial, '#hello' do
  context 'for a new project' do
    it 'greets the world' do
      trial = Trial.new
      expect(trial.hello).to eq 'Hello, world!'
    end
  end
end
