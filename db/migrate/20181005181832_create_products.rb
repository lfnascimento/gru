class CreateProducts < ActiveRecord::Migration[5.1]

  def change
    create_table :products do |t|
      t.string :serial_number, null: false, default: ''
      t.string :short_description, null: false, default: ''
      t.text :description

      t.timestamps null: false
    end

    add_index :products, :serial_number, unique: true
  end

end
