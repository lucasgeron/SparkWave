class CreateAppSpecializations < ActiveRecord::Migration[7.0]
  def change
    create_table :app_specializations do |t|
      t.references :area, null: false, foreign_key: {to_table: :app_areas}
      t.string :name

      t.timestamps
    end
  end
end
