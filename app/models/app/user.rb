class App::User < ApplicationRecord
  
  belongs_to :queue, class_name: 'App::Queue', foreign_key: 'queue_id'

  def duration
    
    Time.at(self.updated_at - self.created_at).utc.strftime("%H:%M:%S")
  end
end
