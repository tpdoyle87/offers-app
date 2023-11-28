# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.text :description

      t.timestamps
    end
  end
end