# frozen_string_literal: true
require 'tty-box'
require_relative '../command'

module Scitools
  module Formulas
    class Motion < Scitools::Command

      def initialize(options = {})
        @options = options
      end

      def displacement
        pastel = Pastel.new
        notice = pastel.blue.bold.detach
        answer = pastel.red.bold.detach

        header = notice.call('Displacement is defined to be the change in position of an object.')
        forumla = '∆x = xƒ - x0'

        box = TTY::Box.frame header, forumla, padding: 3, align: :center
        print box

        x0 = prompt.ask 'What was the original location (x0) ?', convert: :float
        xf = prompt.ask 'What was the final location (xƒ) ?', convert: :float

        answer_box = TTY::Box.frame answer.("The displacement is #{xf - x0}"), padding: 3, align: :center
        print answer_box

      end

    end
  end
end
