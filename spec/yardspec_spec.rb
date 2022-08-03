# frozen_string_literal: true

module Foo
  # @example Returns "baz".
  #   expect(Foo::Bar.new.baz).to eq('baz')
  class Bar
    # @example Returns "baz".
    #   expect(Foo::Bar.new.baz).to eq('baz')
    #
    # @example Returns "bazbaz" for count 2.
    #   expect(Foo::Bar.new.baz(count: 2)).to eq('bazbaz')
    #
    # @return [String]
    def baz(count: 1)
      'baz' * count
    end
  end
end

Yardspec.define_examples(__FILE__)
