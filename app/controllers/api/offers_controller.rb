# frozen_string_literal: true

module Api
  class OffersController < ApplicationController
    before_action :authenticate_user!
    def index
      if user_signed_in?
        render json: { offers: current_user.matching_offers }, status: :ok
      else
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    end
  end
end
