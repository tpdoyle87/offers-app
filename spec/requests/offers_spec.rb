# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Offers' do
  let(:user) { create(:user, gender: nil) }

  context 'when user is authenticated' do
    before do
      sign_in user
      10.times do
        create(:offer, active: true, audience: create(:audience, gender: nil, minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10))
      end
    end

    describe 'GET /index' do
      it 'returns http success when user is authenticated' do
        get '/offers'
        expect(response).to have_http_status(:success)
      end

      it 'returns matching offers when a user is authenticated' do
        get '/offers'
        expect(response.body).to include('Total Offers: 10')
      end
    end
  end

  context 'when user is not authenticated' do
    it 'returns http redirect when user is not authenticated' do
      get '/offers'
      expect(response).to have_http_status(:redirect)
    end
  end
end
