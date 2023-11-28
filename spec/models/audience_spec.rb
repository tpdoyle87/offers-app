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
require 'rails_helper'

RSpec.describe Audience do
  describe 'validations' do
    context 'when gender is not valid' do
      it 'is not valid' do
        audience = build(:audience, gender: 'InvalidGender')
        expect(audience).not_to be_valid
      end
    end

    context 'when gender is valid' do
      it 'is valid' do
        audience = build(:audience, gender: 'Male')
        expect(audience).to be_valid
      end
    end

    context 'when minimum_age is greater than maximum_age' do
      it 'is not valid' do
        audience = build(:audience, minimum_age: 40, maximum_age: 30)
        expect(audience).not_to be_valid
      end
    end

    context 'when minimum_age is less than maximum_age' do
      it 'is valid' do
        audience = build(:audience, minimum_age: 30, maximum_age: 40)
        expect(audience).to be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:offers) }
  end
end
