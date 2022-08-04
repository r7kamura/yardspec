# frozen_string_literal: true

require_relative 'yardspec/version'

require 'rspec'
require 'yard'

# Provide `Yardspec.define_examples` as entry point.
module Yardspec
  class << self
    # Define RSpec examples from YARD @example.
    def define_examples(*args)
      ::YARD.parse(*args)
      define_rspec_examples
    end

    private

    def define_rspec_examples
      code_objects.each do |code_object|
        ::RSpec.describe(code_object.path, type: :yardspec) do
          code_object.tags('example').each do |tag|
            it(tag.name) do
              instance_eval(
                tag.text,
                tag.object.file,
                tag.object.files.first.last
              )
            end
          end
        end
      end
    end

    # @return [Array<YARD::CodeObjects::Base>]
    def code_objects
      ::YARD::Registry.all.select do |code_object|
        code_object.tag('example')
      end
    end
  end
end
