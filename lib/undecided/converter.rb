# Convert data to required type
class Converter
  # Convert array, hash's keys or solo values to symbol
  def self.to_symbol(value)
    if value.is_a?(Array)
      value.map(&:to_sym)
    elsif value.is_a? Hash
      value.map { |k, v| [k.to_sym, v] }.to_h
    else
      # for String and Number solo values
      value.to_s.to_sym
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
