class CreateAppHealthUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :app_health_units do |t|
      t.string :name
      t.string :city
      t.string :address
      t.string :phone
      t.string :category
      t.string :token

      t.timestamps
    end
  end
end
