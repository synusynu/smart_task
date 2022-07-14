# frozen_string_literal: true

require_relative '../lib/webserver_log_parser'

RSpec.describe WebserverLogParser do
  let(:log_file_path) { 'spec/fixtures/test.log' }

  it 'displays sorted lists of views and unique views' do
    output_string = <<~TEXT
      Views
      ----------
      /help_page/1 4
      /contact 2
      /home 2

      Unique views
      ----------
      /help_page/1 4
      /home 2
      /contact 1

    TEXT

    expect { WebserverLogParser.new(log_file_path).call }.to output(output_string).to_stdout
  end
end
