class CreateAppWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :app_workspaces do |t|
      t.references :health_unit, null: false, foreign_key: {to_table: :app_health_units}

      t.timestamps
    end
  end
end
