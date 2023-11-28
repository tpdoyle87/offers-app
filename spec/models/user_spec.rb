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
#  index_users_on_email                 (email)
#  index_users_on_gender                (gender)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user, gender: 'Female', birthdate: '1987-10-13') }
  let(:offer_one) { create(:offer, active: true, audience: create(:audience, gender: 'Male', minimum_age: 50, maximum_age: 65)) }
  let(:offer_two) { create(:offer, active: true, audience: create(:audience, gender: 'All', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }
  let(:offer_three) { create(:offer, active: true, audience: create(:audience, gender: 'Female', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }
  let(:offer_four) { create(:offer, active: true, audience: create(:audience, gender: 'Female', minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10)) }

  describe '#calculate_age' do
    it 'calculates the correct age' do
      expected_min_age = 35
      expected_max_age = 45
      expect(user.calculate_age).to be_between(expected_min_age, expected_max_age).inclusive
    end
  end

  describe '#matching_offers' do
    it 'returns offers matching the user\'s age and gender' do
      expect(user.matching_offers).to include(offer_two, offer_three, offer_four)
    end

    it 'does not return non matching offers' do
      expect(user.matching_offers).not_to include(offer_one)
    end

    it 'returns active offers only' do
      inactive_offer = create(:offer, active: false, audience: create(:audience, gender: user.gender, minimum_age: user.calculate_age, maximum_age: user.calculate_age + 10))
      expect(user.matching_offers).not_to include(inactive_offer)
    end
  end
end
