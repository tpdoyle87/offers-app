# frozen_string_literal: true

class CreateAudiences < ActiveRecord::Migration[7.1]
  def change
    create_table :audiences do |t|
      t.integer :minimum_age
      t.integer :maximum_age
      t.string :gender

      # add db level constraints to ensure data integrity.
      t.check_constraint "minimum_age IS NULL OR maximum_age IS NULL OR minimum_age <= maximum_age"
      t.check_constraint "gender IN ('Male', 'Female', 'All')"

      t.timestamps
    end
  end
end
