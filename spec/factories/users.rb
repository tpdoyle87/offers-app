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
FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    gender { ["Male", "Female"].sample } # Example of random gender
    birthdate { "1990-01-01" }
    username { Faker::Internet.username } # Using Faker to generate unique usernames
    email { Faker::Internet.safe_email }
    password { "password" } # You can choose a more secure default password
    uid { email } # UID is often set to email for devise_token_auth
    provider { "username" } # or "email" if you use email for authentication
    tokens { {} } # Empty hash for tokens initially

    # Other attributes as needed
  end
end
