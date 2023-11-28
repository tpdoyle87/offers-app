# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Offers', type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET /index' do
    it 'returns http success when user is authenticated' do
      sign_in user  # Simulate authentication for the user
      get '/offers'
      expect(response).to have_http_status(:success)
    end

    it 'returns http redirect when user is not authenticated' do
      get '/offers'
      expect(response).to have_http_status(:redirect)
    end
  end
end
