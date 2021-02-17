# frozen_string_literal: true

require 'tty-box'
require_relative '../command'

module Scitools
  module Formulas
    class Atoms < Scitools::Command
      def initialize(options = {})
        @options = options
        @pastel = Pastel.new
        @notice = @pastel.white.bold.detach
        @regular = @pastel.clear.detach
        @answer = @pastel.red.bold.detach
        @spacer = ''
      end

      def definitions
        box = TTY::Box.frame @notice.call('Pure substances that have specific properties are called *Elements*'),
                             @regular.call('Oxygen, Gold and Nitrogen are all examples of elements.'),
                             '',
                             @notice.call('*Atom* is the most basic unit of these elements.'),
                             @regular.call('An atom is made of fundamental elements: protons(p+), neutrons(n0), and electrons(e-).'),
                             '',
                             @notice.call('The number of *protons* in an atom is the *atomic number* on the elements table.'),
                             @regular.call('Oxygen for example, has an atomic number of 8 and therefore has 8 protons(p+).'),
                             '',
                             @notice.call('The nucleus of an atom is made up of protons(p+) and neutrons(n0)'),
                             @regular.call('*Isotopes* have identical number of protons(p+) but different number of neutrons(n0).'),
                             '',
                             @notice.call('Atoms that have the same number of protons(p+) and electrons(e-) are considered neutrally charged.'),
                             @regular.call('If an atom looses an electron(e-) it becomes *positively charged*.'),
                             @regular.call('If an atom gains an electron(e-) it becomes *negatively charged*.'),
                             '',
                             @notice.call('Atomic Mass Unit is abbreviated as (AMU) or just (u).'),
                             @regular.call('It is defined as 1.660540 x 10^-27 kg'),
                             @regular.call("Proton's(p+) mass is about 1u, and neutron(n0) mass is a little bigger then 1u."),
                             @regular.call('Both can be rounded off to 1u.'),
                             @regular.call('Electrons(e-) are 1/2000th of a Proton(p+).'),
                             '',
                             @notice.call('*Isotopes* are different versions of an element.'),
                             @regular.call('They have same number of protons, but different number of electrons'),
                             '',
                             @notice.call('Atomic Mass can be calculated bu adding a number of protons(p+) and neutrons(n0)'),
                             @regular.call('Average Atomic Mass (as listed on the table) is a weighted average of the element *isotopes*'),
                             padding: 3, align: :left
        print box
      end

      def subatomic_calculator
        header = @notice.call('Atomic Weight is the sum of protons and neutrons')
        forumla = 'a - p = n'

        box = TTY::Box.frame header, forumla, padding: 3, align: :center
        print box
      end

      def print_answer(message)
        answer_box = TTY::Box.frame message, padding: 3, align: :center
        print answer_box
      end
    end
  end
end
