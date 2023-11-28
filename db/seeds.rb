# frozen_string_literal: true

require 'faker'

# Create a fixed set of 5 audiences
audiences = [
  Audience.create(minimum_age: 18, maximum_age: 24, gender: 'Female'),
  Audience.create(minimum_age: 25, maximum_age: 34, gender: 'Male'),
  Audience.create(minimum_age: 35, maximum_age: 44, gender: 'Female'),
  Audience.create(minimum_age: 45, maximum_age: 54, gender: 'Male'),
  Audience.create(minimum_age: 55, maximum_age: 64, gender: 'Female'),
  Audience.create(minimum_age: 35, maximum_age: 44, gender: 'Male')
]

# Create 100 offers, each associated with one of the audiences
100.times do
  Offer.create(
    description: Faker::Marketing.buzzwords,
    audience: audiences.sample  # Randomly pick one of the audiences
  )
end
