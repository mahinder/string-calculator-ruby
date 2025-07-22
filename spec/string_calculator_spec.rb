require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number for a single input' do
      expect(StringCalculator.add("4")).to eq(5)
    end
  end
end