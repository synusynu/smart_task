# frozen_string_literal: true

class WebpageCollection
  def initialize(webpages = {})
    @webpages = webpages
  end

  def fetch(url, default_value = nil)
    @webpages[url] ||= default_value
  end

  def order_by(attribute)
    @webpages.values.sort_by { |webpage| -webpage.public_send(attribute) }
  end
end
