# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :birthdate, :gender, presence: true

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
