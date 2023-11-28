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

FactoryBot.define do
  factory :offer do
    description { 'Sample Offer Description' }
    title { 'Sample Offer Title' }
    active { [true, false].sample } # Randomly sets active to true or false
    association :audience, factory: :audience # Associate with an Audience factory
  end
end
