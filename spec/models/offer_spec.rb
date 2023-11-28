# frozen_string_literal: true

# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  audience_id :bigint           not null
#
# Indexes
#
#  index_offers_on_audience_id  (audience_id)
#
# Foreign Keys
#
#  fk_rails_...  (audience_id => audiences.id)
#
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
