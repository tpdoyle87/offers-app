# frozen_string_literal: true

# == Schema Information
#
# Table name: audiences
#
#  id          :bigint           not null, primary key
#  gender      :string
#  maximum_age :integer
#  minimum_age :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_audiences_on_gender       (gender)
#  index_audiences_on_maximum_age  (maximum_age)
#  index_audiences_on_minimum_age  (minimum_age)
#
FactoryBot.define do
  factory :audience do
    gender { ['Male', 'Female', nil].sample }
    minimum_age { Faker::Number.between(from: 18, to: 45) }
    maximum_age { Faker::Number.between(from: 46, to: 75) }
  end
end
