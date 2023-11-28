# frozen_string_literal: true

class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    @offers = current_user.matching_offers
  end

  def show
    @offer = Offer.find(params[:id])
  end
end
