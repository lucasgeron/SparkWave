class CreateAppUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :app_users do |t|
      t.boolean :finished
      t.references :queue, null: false, foreign_key: { to_table: :app_queues }

      t.timestamps
    end
  end
end
