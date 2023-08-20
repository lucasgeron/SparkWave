class App::User < ApplicationRecord
  belongs_to :queue, class_name: 'App::Queue', foreign_key: 'queue_id'

end
