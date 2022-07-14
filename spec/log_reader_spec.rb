# frozen_string_literal: true

require_relative '../lib/log_reader'

RSpec.describe LogReader do
  let(:log_file_path) { 'spec/fixtures/test.log' }

  it 'yields url and ip_adress for each line' do
    expect { |b| described_class.new(log_file_path).each_entry(&b) }.to yield_control.exactly(8).times
  end
end
