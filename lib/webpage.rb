# frozen_string_literal: true

require 'debug'
class Webpage
  attr_reader :url, :views

  def initialize(url:, views: [])
    @url = url
    @views = views
  end

  def views_count
    @views_count ||= @views.size
  end

  def unique_views_count
    @unique_views_count ||= @views.uniq.count
  end

  def add_view(ip_address)
    @views << ip_address
  end
end
