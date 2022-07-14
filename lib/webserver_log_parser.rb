# frozen_string_literal: true

require_relative 'webpage_collection'
require_relative 'webpage'
require_relative 'log_reader'
require_relative 'webpages_serializer'
require_relative 'terminal_presenter'

class WebserverLogParser
  def initialize(log_file_path)
    @log_file_path = log_file_path
    @webpages = WebpageCollection.new
  end

  def call
    LogReader.new(log_file_path).each_entry do |url, ip_address|
      webpages.fetch(url, Webpage.new(url: url)).add_view(ip_address)
    end

    TerminalPresenter.new(
      'Views',
      WebpagesSerializer.new(webpages.order_by(:views_count)).serialize(:url, :views_count)
    ).print

    TerminalPresenter.new(
      'Unique views',
      WebpagesSerializer.new(webpages.order_by(:unique_views_count)).serialize(:url, :unique_views_count)
    ).print
  end

  private

  attr_reader :webpages, :log_file_path
end
