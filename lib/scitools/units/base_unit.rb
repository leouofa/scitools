# frozen_string_literal: true

module Scitools
  module Units
    class BaseUnit
      attr_reader :name, :symbol, :measure

      def initialize(name, symbol, measure)
        @name = name
        @symbol = symbol
        @measure = measure
      end


    end
  end
end
