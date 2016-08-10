module Undecided
  # Evaluate rules and values to minimize security risk before do eval
  class Evaluator
    # REGEX that match operators
    VARIABLE_REGEX = /\&|\||\(|\)|!/
    # Check if rule and values are valid to evaluate
    def self.valid?(rule, values, strict = true)
      # Extract variables from rule
      variables = extract_variables(rule)

      return false if variables.empty?

      # if validation is not strict, add missing values
      fill_values(variables, values) unless strict

      # Check if rule's variable and values's keys are the same
      (variables - Converter.to_symbol(values.keys)).empty?
    end

    # If there are more variables than values, then added as false
    def self.fill_values(variables, values)
      extras = variables - Converter.to_symbol(values.keys)
      extras.each { |e| values[Converter.to_symbol(e)] = false }
    end

    # Check if value is a boolean type
    def self.bool?(value)
      [true, false].include? value
    end

    # Apply regex to rule to extract variables
    def self.extract_variables(rule)
      Converter.to_symbol(rule.split(VARIABLE_REGEX).reject(&:empty?).uniq)
    end
  end
end
