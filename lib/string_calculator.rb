class StringCalculator
  def self.add(input)
   return 0 if input.empty?
   numbers = input.split(",")
   numbers.map(&:to_i).sum
  end
end