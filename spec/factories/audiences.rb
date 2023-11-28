# frozen_string_literal: true

FactoryBot.define do
  factory :audience do
    minimum_age { 1 }
    maximum_age { 1 }
    gender { 'MyString' }
  end
end
