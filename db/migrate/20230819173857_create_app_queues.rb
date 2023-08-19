class CreateAppQueues < ActiveRecord::Migration[7.0]
  def change
    create_table :app_queues do |t|
      t.references :workspace, null: false, foreign_key: {to_table: :app_workspaces}
      t.string :category

      t.timestamps
    end
  end
end
