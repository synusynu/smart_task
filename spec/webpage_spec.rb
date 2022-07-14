# frozen_string_literal: true

require_relative '../lib/webpage'

RSpec.describe Webpage do
  subject { described_class.new(url: '/test/1', views: ['123.123.123.123', '234.234.234.234', '123.123.123.123']) }

  it 'counts views' do
    expect(subject.views_count).to eq(3)
  end

  it 'counts unique views' do
    expect(subject.unique_views_count).to eq(2)
  end

  it 'adds view to its list' do
    subject.add_view('111.111.111.111')
    expect(subject.views).to eq(['123.123.123.123', '234.234.234.234', '123.123.123.123', '111.111.111.111'])
  end
end
