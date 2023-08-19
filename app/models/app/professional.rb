class App::Professional < ApplicationRecord
  has_many :areas, class_name: 'App::Area'
end
