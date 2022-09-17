module Countable
  extend ActiveSupport::Concern

  included do
    before_save :set_counter
  end

  def set_counter
    self.counter += 1
  end

  def self.display_counter
    "#{self.class.name} counter: #{all.count}"
  end
end
