# frozen_string_literal: true

class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    @offers = current_user.matching_offers
  end
end
