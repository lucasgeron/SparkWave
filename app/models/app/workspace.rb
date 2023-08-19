class App::Workspace < ApplicationRecord
  belongs_to :health_unit, class_name: 'App::HealthUnit', foreign_key: 'health_unit_id'
  has_many :queues, class_name: 'App::Queue'
  has_many :health_insurances, class_name: 'App::HealthInsurance'
  has_many :professionals, class_name: 'App::Professional'

end
