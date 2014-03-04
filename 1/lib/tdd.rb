class IntegerGrouper
  DELIMITER  = ','
  GROUP_SIZE = 3
  COVERED_RANGE = (0...1_000_000_000)

  attr_reader :input, :processed_input

  def initialize(input)
    @input = input
  end

  def format
    validate_input
    process_input
    format_output
    processed_input
  end

  private

  def process_input
    @processed_input = as_groups.map do |group|
      (group.join + DELIMITER)
    end.join.reverse
  end

  def as_groups
    input.to_s.split('').reverse.each_slice(GROUP_SIZE).to_a
  end

  def validate_input
    raise Exception unless COVERED_RANGE.include?(input)
  end

  def format_output
    @processed_input = clean_initial_delimiter(processed_input)
  end

  def clean_initial_delimiter(str)
    str[1..-1] if str[0] == DELIMITER
  end
end
