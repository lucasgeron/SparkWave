class App::User < ApplicationRecord
  belongs_to :queue, class_name: 'App::Queue', foreign_key: 'queue_id'

  def duration
    self.created_at - self.updated_at
  end
end
