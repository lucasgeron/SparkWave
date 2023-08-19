class App::Area < ApplicationRecord
  has_many :specializations, class_name: 'App::Specialization'
end
