class App::Queue < ApplicationRecord
  belongs_to :health_unit, class_name: 'App::HealthUnit'
  has_many :users, class_name: 'App::User'

  CATEGORIES = %w[priority  regular  pediatric].freeze

end
