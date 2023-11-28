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
class Audience < ApplicationRecord
  has_many :offers

  validates :gender, inclusion: { in: %w(Male Female All) }, allow_blank: false
  validate :maximum_age_validation
  validate :minimum_age_validation

  private

  def maximum_age_validation
    return if maximum_age.blank? || minimum_age.blank?
    return if maximum_age > minimum_age

    errors.add(:maximum_age, "must be greater than the minimum age")
  end

  def minimum_age_validation
    return if minimum_age.blank? || maximum_age.blank?
    return if minimum_age < maximum_age

    errors.add(:minimum_age, "must be less than the maximum age")
  end
end
