# frozen_string_literal: true

require_relative '../lib/webpage_collection'

RSpec.describe WebpageCollection do
  it 'fetches webpage for already added url' do
    webpage = double(url: 'url1', views: %w[123.123.123.123 123.123.123.123 123.123.123.123])
    webpages = WebpageCollection.new('url1' => webpage)

    expect(webpages.fetch('url1')).to eq(webpage)
  end

  it 'allows to pass default value for not yet added url' do
    webpages = WebpageCollection.new
    webpage = double(url: 'url1')

    expect(webpages.fetch('url1', webpage)).to eq(webpage)
  end

  it 'orders items by given attribute' do
    webpage1 = double(url: 'url1', views_count: 3)
    webpage2 = double(url: 'url2', views_count: 1)
    webpage3 = double(url: 'url3', views_count: 2)

    webpages = WebpageCollection.new('url1' => webpage1, 'url2' => webpage2, 'url3' => webpage3)

    expect(webpages.order_by(:views_count)).to eq([webpage1, webpage3, webpage2])
  end
end
