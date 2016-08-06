# Convert data to required type
class Converter
  # Convert array and hash's keys to symbol
  def self.to_symbol(value)
    if value.is_a?(Array)
      value.map(&:to_sym)
    else
      value.map { |k, v| [k.to_sym, v] }.to_h
    end
  end

  # Transform value to boolean
  def self.to_bool(value)
    # if boolean return value
    return value if @evaluator.bool?(value)
    # transform integer value to boolean
    !value.zero?
  rescue
    raise "#{value} Is not a correct value, " \
          'insert (1 or 0) or (true or false)'
  end
end
