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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :birthdate, :gender, :username, presence: true

  def calculate_age
    now = Time.zone.today
    age = now.year - birthdate.year
    age -= 1 if birthdate > now.years_ago(age)
    age
  end

  def matching_offers
    age = calculate_age
    Offer.joins(:audience)
      .where('audiences.minimum_age <= ? AND audiences.maximum_age >= ? AND audiences.gender = ?', age, age, gender).distinct
  end
end
