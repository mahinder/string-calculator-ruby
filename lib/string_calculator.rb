class StringCalculator
    
  def self.add(input)
   return 0 if input.empty?
   delimiter = /,|\n/
   
   if input.start_with?("//")
    parts = input.split("\n", 2)
    custom_delim = Regexp.escape(parts[0][2..])
    delimiter = /#{custom_delim}/
    input = parts[1]
   end

   numbers = input.split(delimiter)
   numbers.map(&:to_i).sum
  end
end