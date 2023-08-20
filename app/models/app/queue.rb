class App::Queue < ApplicationRecord
  belongs_to :health_unit, class_name: 'App::HealthUnit'
  has_many :users, class_name: 'App::User'

  # has_enumeration_for :category, with: QueueCategory, create_helpers: true, create_scopes: true

  CATEGORIES = %w[priority regular pediatric].freeze
end
