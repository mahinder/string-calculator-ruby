class StringCalculator
  # Adds numbers from a string.
  # The method can handle custom delimiters and raises an error for negative numbers.

  class NegativeNumberError < StandardError; end
  class InvalidInputFormatError < StandardError; end

  DEFAULT_DELIMITER = /,|\n/.freeze

  def self.add(input)
    return 0 if input.nil? || input.strip.empty?

    delimiter, numbers_string = extract_delimiter_and_numbers(input)
    numbers = parse_numbers(numbers_string, delimiter)

    check_for_negatives(numbers)

    numbers.sum
  end

  private

  def self.extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      header, body = input.split("\n", 2)
      raise InvalidInputFormatError, "Missing numbers after delimiter declaration" unless body

      custom_delim = header[2..]
      raise InvalidInputFormatError, "Invalid custom delimiter format" if custom_delim.strip.empty?

      [Regexp.new(Regexp.escape(custom_delim)), body]
    else
      [DEFAULT_DELIMITER, input]
    end
  end
  def self.parse_numbers(numbers_string, delimiter)
    numbers_string.split(delimiter).map do |n|
      Integer(n)
    rescue ArgumentError
      raise InvalidInputFormatError, "Invalid number: '#{n}'"
    end
  end

  def self.check_for_negatives(numbers)
    negatives = numbers.select(&:negative?)
    raise NegativeNumberError, "negative numbers not allowed #{negatives.join(",")}" unless negatives.empty?
  end
end
