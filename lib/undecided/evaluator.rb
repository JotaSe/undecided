module Undecided
  # Evaluate rules and values to minimize security risk before do eval
  class Evaluator
    # REGEX that match operators
    VARIABLE_REGEX = /\&|\||\(|\)|!/

    # Check if rule and values are valid to evaluate
    def valid?(rule, values)
      # Extract variables from rule
      variables = extract_variables(rule)

      return false if variables.empty?
      # Check if rule's variable and values's keys are the same
      (variables - Converter.to_symbol(values.keys)).empty?
    end

    # Check if value is a boolean type
    def bool?(value)
      [true, false].include? value
    end

    # Apply regex to rule to extract variables
    def extract_variables(rule)
      Converter.to_symbol(rule.split(VARIABLE_REGEX).reject(&:empty?).uniq)
    end
  end
end
