# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Offer do
  fixtures :offers, :audiences
  it 'has a description' do
    offer = offers(:offer_two)
    expect(offer.description).to eq('A special deal just for you!')
  end

  it 'belongs to an audience' do
    offer = offers(:offer_one)

    expect(offer.audience).to eq(audiences(:audience_one))
  end
end