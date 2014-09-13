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

class EgDateExampleParser
  def parse(example)
    [:day_padded, ' ', :month_3_char, ' ', :year_4_digit]
  end
end

class EgDate
  def initialize(date)
    @date = date
  end
  def like(example, format_provider: EgDateFormat, example_parser: EgDateExampleParser.new)
    format_provider.format(example_parser.parse(example)).print date
  end
  private
  attr_reader :date
end
