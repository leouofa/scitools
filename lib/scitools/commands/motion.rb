# frozen_string_literal: true

require_relative '../command'
require_relative '../formulas/motion'

module Scitools
  module Commands
    class Motion < Scitools::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        formula = prompt.select('Which formula would you like to load?', ['Displacement'], ['Average Velocity'])
                        .downcase.gsub(' ', '_')

        formula_bank = Scitools::Formulas::Motion.new
        formula_bank.send(formula)
      end
    end
  end
end
