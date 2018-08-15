class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.text :temperature_f
      t.text :weather_condition
      t.decimal :flow_rate_cfs

      t.timestamps
    end
  end
end
