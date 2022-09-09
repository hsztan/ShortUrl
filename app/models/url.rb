# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :clicks, dependent: :destroy
  scope :latest, -> { order(created_at: :desc).limit(10) }

  validates :original_url, presence: true
  validate :valid_url

  def self.create_short_url
    (1..5).map { rand(65..90).chr }.join.upcase
  end

  def browsers_clicks
    clicks.group(:browser).count.map { |k, v| [k, v] }
  end

  def platforms_clicks
    clicks.group(:platform).count.map { |k, v| [k, v] }
  end

  def daily_clicks
    last_10_days = (0..9).map { |i| Date.today - i.days }
    dates = (1..10).to_a
    day_clicks = clicks.group_by_day(:created_at).count.values_at(*last_10_days).map { |v| v || 0 }.reverse
    day_clicks.zip(dates).map { |k, v| [v, k] }
  end

  private

  def url_valid?
    uri = URI(original_url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def valid_url
    return if url_valid?

    errors.add(:original_url, 'is not a valid URL')
  end
end
