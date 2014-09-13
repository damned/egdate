require_relative 'egdate/example_parser'
require_relative 'egdate/format'

class EgDate
  def initialize(date)
    @date = date
  end
  def like(example, format_provider: Eg::Date::Format, example_parser: Eg::Date::ExampleParser.new)
    format_provider.format(example_parser.parse(example)).print date
  end
  private
  attr_reader :date
end
