class CreateAppProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :app_professionals do |t|
      t.string :name
      t.string :crm
      t.string :role

      t.timestamps
    end
  end
end
