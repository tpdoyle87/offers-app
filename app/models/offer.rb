# frozen_string_literal: true

class Offer < ApplicationRecord
  validates :description, presence: true
  belongs_to :audience
end
