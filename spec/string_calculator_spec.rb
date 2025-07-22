require "string_calculator"

# This file contains the RSpec tests for the StringCalculator class.
RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for nil input" do
      expect(described_class.add(nil)).to eq(0)
    end

    # Test case for an empty string, expecting 0.
    it "returns 0 for empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    # Test case for a single number, expecting the number itself.
    it "returns the number for a single input" do
      expect(StringCalculator.add("4")).to eq(4)
    end

    # Test case for two comma-separated numbers.
    it "returns sum of two comma-separated numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    # Test case for multiple comma-separated numbers.
    it "returns sum of multiple comma-separated numbers" do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    # Test case for handling newlines as delimiters.
    it "handles newlines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    # Test case for a custom delimiter.
    it "supports custom delimiter" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises error if custom delimiter is declared but missing newline" do
      expect {
        described_class.add("//;")
      }.to raise_error(StringCalculator::InvalidInputFormatError)
    end

    # Test case for a single negative number, expecting an error.
    it "raises error for negative numbers" do
      expect { StringCalculator.add("1,-2") }.to raise_error("negative numbers not allowed -2")
    end

    # Test case for multiple negative numbers, expecting an error that lists all of them.
    it "lists all negative numbers in error" do
      expect { StringCalculator.add("-1,-2,3") }.to raise_error("negative numbers not allowed -1,-2")
    end
  end
end
