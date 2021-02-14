# frozen_string_literal: true

require_relative '../command'
require_relative '../units/converter'

module Scitools
  module Commands
    class ConvertUnit < Scitools::Command
      def initialize(number, from_unit, to_unit, options)
        @number = number
        @from_unit = from_unit
        @to_unit = to_unit
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        converter = Scitools::Units::Converter.new

        from = converter.find_unit(@from_unit)
        to = converter.find_unit(@to_unit)

        output.puts "Converting #{@number} #{from} to #{to}"
      end
    end
  end
end
