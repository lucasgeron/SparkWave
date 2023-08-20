class App::Queue < ApplicationRecord
  belongs_to :heal_unit, class_name: 'App::HealthUnit'
  has_many :users, class_name: 'App::User'

  CATEGORIES = %w[priority  regular  pediatric].freeze

end
