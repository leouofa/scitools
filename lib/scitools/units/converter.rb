# frozen_string_literal: true

require_relative './prefix'
require_relative './base_unit'
require 'byebug'

module Scitools
  module Units
    class Converter
      def initialize
        @prefixes = []

        @prefixes.push Prefix.new 'deci', 'd', -1
        @prefixes.push Prefix.new 'centi', 'c', -2
        @prefixes.push Prefix.new 'milli', 'm', -3
        @prefixes.push Prefix.new 'micro', 'µ', -6
        @prefixes.push Prefix.new 'nano', 'n', -9
        @prefixes.push Prefix.new 'pico', 'p', -12
        @prefixes.push Prefix.new 'femto', 'f', -15
        @prefixes.push Prefix.new 'atto', 'a', -18
        @prefixes.push Prefix.new 'zepto', 'z', -21
        @prefixes.push Prefix.new 'yocto', 'y', -21

        @prefixes.push Prefix.new 'deca', 'da', 1
        @prefixes.push Prefix.new 'hecto', 'h', 2
        @prefixes.push Prefix.new 'kilo', 'k', 3
        @prefixes.push Prefix.new 'mega', 'M', 6
        @prefixes.push Prefix.new 'giga', 'G', 9
        @prefixes.push Prefix.new 'tera', 'T', 12
        @prefixes.push Prefix.new 'peta', 'P', 15
        @prefixes.push Prefix.new 'exa', 'E', 18
        @prefixes.push Prefix.new 'zetta', 'Z', 21
        @prefixes.push Prefix.new 'yotta', 'Y', 24

        @base_units = []

        # one symbol units
        @base_units.push BaseUnit.new 'second', 's', 'time'
        @base_units.push BaseUnit.new 'metre', 'm', 'length'
        @base_units.push BaseUnit.new 'ampere', 'A', 'electric current'
        @base_units.push BaseUnit.new 'kelvin', 'K', 'thermodynamic temperature'

        # technically the the base unit for mass is a kg, but we're going to make it grams
        # to make the conversion easier
        @base_units.push BaseUnit.new 'gram', 'g', 'mass'

        # two symbol units
        @base_units.push BaseUnit.new 'candela', 'cd', 'luminous intensity'

        # three symbol units
        @base_units.push BaseUnit.new 'mole', 'mol', 'amount of substance'
      end

      def find_unit(unit)
        base_unit = find_base(unit)
        prefix = find_prefix(unit, base_unit[:position])

        return {
          base: base_unit,
          prefix: prefix
        }
      end

      def find_base(unit)
        @base_units.each_with_index do |base, index|
          if index >= 0 && index < 5
            if unit[0] == base.symbol
              return {
                base: base,
                position: 1
              }
            end
          elsif index >= 5 && index < 6
            if unit[0..1] == base.symbol
              return {
                base: base,
                position: 2
              }
            end
          elsif index >= 6
            if unit[0..2] == base.symbol
              return {
                base: base,
                position: 3
              }
            end
          end
        end

        raise StandardError, 'Unit not found'
      end

      def find_prefix(unit, position)
        return nil if unit.length < 2

        unit_prefix = nil

        @prefixes.each do |prefix|
          unit_prefix = prefix if prefix.symbol == unit[position..(unit.length)]
        end

        raise StandardError, 'Prefix not found' unless unit_prefix

        unit_prefix
      end
    end
  end
end
