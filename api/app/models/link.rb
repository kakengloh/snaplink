class Link < ApplicationRecord
  has_many :visits, class_name: 'LinkVisit'

  validates :slug, presence: true
  validates :target_url, presence: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp}\z/ }
  validates :short_url, presence: true
end
