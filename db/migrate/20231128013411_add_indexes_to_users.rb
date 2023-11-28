# frozen_string_literal: true

class AddIndexesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :birthdate
    add_index :users, :gender
  end
end
