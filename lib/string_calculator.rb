class StringCalculator
  # Adds numbers from a string.
  # The method can handle custom delimiters and raises an error for negative numbers.

  class NegativeNumberError < StandardError; end
  class InvalidInputFormatError < StandardError; end

  def self.add(input)
    return 0 if input.nil? || input.strip.empty?

    delimiter = /,|\n/
    if input.start_with?("//")
      parts = input.split("\n", 2)
      custom_delim = Regexp.escape(parts[0][2..])
      delimiter = /#{custom_delim}/
      input = parts[1]
    end

    numbers = input.split(delimiter).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(",")}"
    end

    numbers.sum
  end
end
