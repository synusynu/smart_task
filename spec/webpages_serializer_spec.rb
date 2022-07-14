# frozen_string_literal: true

require_relative '../lib/webpages_serializer'

RSpec.describe WebpagesSerializer do
  it 'serializes items with selected attributes' do
    webpage1 = double(url: 'url1', views_count: 1)
    webpage2 = double(url: 'url2', views_count: 2)

    expect(described_class.new([webpage1, webpage2]).serialize(:url, :views_count)).to eq([['url1', 1], ['url2', 2]])
  end
end
