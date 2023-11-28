# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Audience do
  fixtures :audiences, :offers
  it 'has many offers' do
    offer = offers(:offer_one)
    expect(offer.audience).to eq(audiences(:audience_one))
  end
end
