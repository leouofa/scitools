# frozen_string_literal: true

require_relative '../command'
require_relative '../formulas/atoms'

module Scitools
  module Commands
    class Atoms < Scitools::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        formula = prompt.select('What would you like to load?', ['Definitions', 'Subatomic Calculator'])
                        .downcase.gsub(' ', '_')

        formula_bank = Scitools::Formulas::Atoms.new
        formula_bank.send(formula)
      end
    end
  end
end
