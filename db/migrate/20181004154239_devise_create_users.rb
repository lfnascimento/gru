# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ''
      t.string :uid,                null: false, default: ''
      t.string :provider,           null: false, default: ''
      t.string :name,               default: ''
      
      t.timestamps null: false
    end

    add_index :users, :email,       unique: true
    add_index :users, :uid,         unique: true
  end
end

