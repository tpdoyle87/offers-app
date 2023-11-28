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
FactoryBot.define do
  factory :offer do
    description { 'MyText' }
  end
end
