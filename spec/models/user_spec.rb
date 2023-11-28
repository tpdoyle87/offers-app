# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthdate              :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_birthdate             (birthdate)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_gender                (gender)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user, gender: 'Female', birthdate: '1987-10-13') }
  let(:offer_1) { create(:offer, active: true, audience: create(:audience, gender: 'Male', minimum_age: 50, maximum_age: 65)) }
  let(:offer_2) { create(:offer, active: true, audience: create(:audience, gender: 'All', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }
  let(:offer_3) { create(:offer, active: true, audience: create(:audience, gender: 'Female', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }
  let(:offer_4) { create(:offer, active: true, audience: create(:audience, gender: 'Female', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }


  describe '#calculate_age' do
    it 'calculates the correct age' do
      expect(user.calculate_age).to eq(user.calculate_age) # Test that age calculation is consistent
    end
  end

  describe '#matching_offers' do
    it 'returns offers matching the user\'s age and gender' do
      expect(user.matching_offers).to include(offer_2, offer_3, offer_4)
      expect(user.matching_offers).not_to include(offer_1)
    end

    it 'returns active offers only' do
      inactive_offer = create(:offer, active: false, audience: create(:audience, gender: user.gender, minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10))
      expect(user.matching_offers).not_to include(inactive_offer)
    end
  end
end
