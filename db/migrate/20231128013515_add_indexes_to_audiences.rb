# frozen_string_literal: true

class AddIndexesToAudiences < ActiveRecord::Migration[7.1]
  def change
    add_index :audiences, :minimum_age
    add_index :audiences, :maximum_age
    add_index :audiences, :gender
  end
end
