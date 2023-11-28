# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
