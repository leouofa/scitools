# frozen_string_literal: true

require 'thor'

module Scitools
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'scitools version'
    def version
      require_relative 'version'
      puts "v#{Scitools::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'convert_unit NUMBER FROM_UNIT TO_UNIT', 'converts a number from one SI unit to another'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def convert_unit(number, from_unit, to_unit)
      if options[:help]
        invoke :help, ['convert_unit']
      else
        require_relative 'commands/convert_unit'
        Scitools::Commands::ConvertUnit.new(number, from_unit, to_unit, options).execute
      end
    end
  end
end
