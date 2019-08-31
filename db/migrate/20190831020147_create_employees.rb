class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :emp_id
      t.integer :att_device_id
      t.string :name
      t.string :phone
      t.date :joining_date
      t.string :designation

      t.timestamps
    end
  end
end
