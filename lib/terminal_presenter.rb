# frozen_string_literal: true

class TerminalPresenter
  def initialize(title, items)
    @title = title
    @items = items
  end

  def print
    puts title

    puts '----------'
    items.each do |item|
      puts item.join(' ')
    end
    puts
  end

  private

  attr_reader :title, :items
end
