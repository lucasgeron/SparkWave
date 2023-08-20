class App::HealthUnit < ApplicationRecord
  has_many :queues, class_name: "App::Queue"

  CATEGORIES = %w[emergency_care_unit pediatric_emergency_care_unit hospital emergency_hospital hospital_emergency_room urgent_care_clinics 24_hour_emergency_care basic_health_unit ].freeze

 
  
  # has_and_belongs_to_many :health_insurances, class_name: "App::HealthInsurance"
end
