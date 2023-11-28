# frozen_string_literal: true

# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  active      :boolean
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
# spec/models/offer_spec.rb

require 'rails_helper'

RSpec.describe Offer do
  let(:offer) { create(:offer, active: true) }

  it 'is valid with valid attributes' do
    expect(offer).to be_valid
  end

  it 'is not valid without a description' do
    offer.description = nil
    expect(offer).not_to be_valid
  end

  it 'belongs to an audience' do
    expect(offer).to belong_to(:audience)
  end

  it 'can be active' do
    offer.active = true
    expect(offer).to be_valid
  end

  it 'can be inactive' do
    offer.active = false
    expect(offer).to be_valid
  end

  it 'can have a title' do
    offer.title = 'Custom Title'
    expect(offer).to be_valid
  end

  it 'has a description' do
    expect(offer.description).to eq('Sample Offer Description')
  end

  it 'has an active status' do
    expect(offer.active).to be_in([true, false])
  end

  it 'has an associated audience' do
    expect(offer.audience).to be_instance_of(Audience)
  end

  it 'is not valid without an active status' do
    offer.active = nil
    expect(offer).not_to be_valid
  end
end
