# app/controllers/custom_registrations_controller.rb
class CustomRegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |resource|
      if resource.persisted? # User is successfully created
        resource.uid = resource.username
        resource.provider = 'username'
        resource.save!
      end
    end
  end
end
