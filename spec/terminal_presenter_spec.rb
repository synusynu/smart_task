# frozen_string_literal: true

require_relative '../lib/terminal_presenter'

RSpec.describe TerminalPresenter do
  it 'displays data in table' do
    items = [
      %w[item1a item1b item1c],
      %w[item2a item2b item2c],
      %w[item3a item3b item3c],
      %w[item4a item4b item4c]
    ]

    output_string = <<~TEXT
      Title
      ----------
      item1a item1b item1c
      item2a item2b item2c
      item3a item3b item3c
      item4a item4b item4c

    TEXT

    expect { TerminalPresenter.new('Title', items).print }.to output(output_string).to_stdout
  end
end
