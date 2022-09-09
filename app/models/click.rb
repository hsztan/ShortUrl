# frozen_string_literal: true

class Click < ApplicationRecord
  belongs_to :url

  validates :browser, presence: true
  validates :platform, presence: true
end
