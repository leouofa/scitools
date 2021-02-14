# frozen_string_literal: true

module Scitools
  module Units
    class Prefix
      def initialize(name, symbol, base_ten)
        @name = name
        @symbol = symbol
        @base_ten = base_ten
        @decimal = 10 ^ base_ten
      end

      attr_reader :name, :symbol, :base_ten, :decimal

    end
  end
end
