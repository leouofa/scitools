# frozen_string_literal: true
require 'tty-box'
require_relative '../command'

module Scitools
  module Formulas
    class Motion < Scitools::Command

      def initialize(options = {})
        @options = options
        @pastel = Pastel.new
        @notice = @pastel.blue.bold.detach
        @answer = @pastel.red.bold.detach
        @spacer = ''
      end

      def displacement
        header = @notice.call('Displacement is defined to be the change in position of an object.')
        forumla = '∆x = xƒ - x0'

        box = TTY::Box.frame header, forumla, padding: 3, align: :center
        print box

        x0 = prompt.ask 'What was the original location (x0) ?', convert: :float
        xf = prompt.ask 'What was the final location (xƒ) ?', convert: :float

        print_answer @answer.("The displacement is #{xf - x0}")

      end

      def average_velocity
        pastel = Pastel.new
        @notice = pastel.blue.bold.detach
        @answer = pastel.red.bold.detach

        header = @notice.call('Velocity is defined as displacement (S) divided by time.')
        note = 'The displacement is a scalar and has a direction.'
        formula = 'v = S/t'
        footer = 'Know that that (or speed) is similar, but has no direction. Its just distance divided by time.'
        formula_2 = 'r = d/t'

        box = TTY::Box.frame header, note, formula, @spacer, footer, formula_2, padding: 3, align: :center
        print box
      end

      def print_answer(message)
        answer_box = TTY::Box.frame message, padding: 3, align: :center
        print answer_box
      end

    end
  end
end
