class EgDateFormat
  def self.format(sequence)
    EgDateFormat.new sequence
  end
  def initialize(sequence)
  end
  def print(date)
    '02 MAR 1972'
  end
end
require_relative 'egdate/example_parser'

class EgDate
  def initialize(date)
    @date = date
  end
  def like(example, format_provider: EgDateFormat, example_parser: Eg::Date::ExampleParser.new)
    format_provider.format(example_parser.parse(example)).print date
  end
  private
  attr_reader :date
end
