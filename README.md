# String Calculator

This is a simple Ruby program that implements a string calculator with some specific rules.

## Features

- Adds numbers provided in a string.
- Supports comma-separated and newline-separated numbers.
- Supports custom delimiters.
- Throws an exception for negative numbers, listing all of them in the message.
- Returns 0 for an empty string.

## Getting Started

To get started with this project, you need to have Ruby installed on your machine.

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/string-calculator-ruby.git
    cd string-calculator-ruby
    ```

2.  Install the dependencies:
    ```bash
    bundle install
    ```

## Usage

The `StringCalculator` class has a single class method, `add`, which takes a string of numbers as input.

```ruby
require_relative 'lib/string_calculator'

puts StringCalculator.add("")
# => 0

puts StringCalculator.add("1")
# => 1

puts StringCalculator.add("1,5")
# => 6

puts StringCalculator.add("1\n2,3")
# => 6

puts StringCalculator.add("//;\n1;2")
# => 3

begin
  StringCalculator.add("1,-2,-3")
rescue => e
  puts e.message
  # => negative numbers not allowed -2,-3
end
```

## Running the Tests

To run the tests, use the following command:

```bash
rspec
``` 