# frozen_string_literal: true

class Audience < ApplicationRecord
  has_many :offers
end
