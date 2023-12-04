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
#  provider               :string           default("username"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
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
class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  include DeviseTokenAuth::Concerns::User


  validates :first_name, :last_name, :birthdate, :username, :email, presence: true
  validates :username, uniqueness: true

  def calculate_age
    now = Time.zone.today
    age = now.year - birthdate.year
    age -= 1 if birthdate > now.years_ago(age)
    age
  end

  def matching_offers
    if gender.present?
      gender_present_query(calculate_age)
    else
      no_gender_query(calculate_age)
    end
  end

  private

  def no_gender_query(age)
    Offer.joins(:audience)
      .where(audiences: { minimum_age: 0..age, maximum_age: age..135 })
      .where(active: true)
      .distinct
  end

  def gender_present_query(age)
    Offer.joins(:audience)
      .where(audiences: { minimum_age: 0..age, maximum_age: age..135, gender:})
      .where(active: true)
      .distinct
  end
end
