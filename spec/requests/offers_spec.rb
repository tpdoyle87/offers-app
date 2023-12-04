# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Offers' do
  let(:user) { create(:user, gender: nil) }
  let(:headers) { valid_headers(user) }

  context 'when user is authenticated' do
    context 'when user is authenticated' do
      before do
        10.times do
          create(:offer, active: true, audience: create(:audience, gender: nil, minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10))
        end
      end

      describe 'GET /api/offers' do
        it 'returns http success when user is authenticated' do
          get '/api/offers', headers: headers
          expect(response).to have_http_status(:success)
        end

        it 'returns matching offers when a user is authenticated' do
          get '/api/offers', headers: headers
          json_response = JSON.parse(response.body)
          expect(json_response['offers'].count).to eq(10) # Adjust according to your actual JSON structure
        end
      end
    end

    context 'when user is not authenticated' do
      it 'returns http unauthorized' do
        get '/api/offers'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
