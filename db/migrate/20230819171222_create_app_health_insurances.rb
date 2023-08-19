class CreateAppHealthInsurances < ActiveRecord::Migration[7.0]
  def change
    create_table :app_health_insurances do |t|
      t.string :name

      t.timestamps
    end
  end
end
