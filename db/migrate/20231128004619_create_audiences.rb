# frozen_string_literal: true

class CreateAudiences < ActiveRecord::Migration[7.1]
  def change
    create_table :audiences do |t|
      t.integer :minimum_age
      t.integer :maximum_age
      t.string :gender

      t.timestamps
    end
  end
end
