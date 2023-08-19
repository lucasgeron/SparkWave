class App::Specialization < ApplicationRecord
  belongs_to :area, class_name: 'App::Area', foreign_key: 'area_id'
end
