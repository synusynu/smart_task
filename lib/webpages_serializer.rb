# frozen_string_literal: true

class WebpagesSerializer
  def initialize(items)
    @items = items
  end

  def serialize(*attributes)
    items.map { |item| attributes.map { |attribute| item.public_send(attribute) } }
  end

  private

  attr_reader :items
end
