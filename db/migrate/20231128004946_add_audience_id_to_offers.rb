# frozen_string_literal: true

class AddAudienceIdToOffers < ActiveRecord::Migration[7.1]
  def change
    add_reference :offers, :audience, null: false, foreign_key: true
  end
end
