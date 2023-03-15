class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_user_registration_path
    #Or :prefix_to_your_route
  end

  def after_update_path_for(resource)
    new_user_investor_path(current_user) # Or :prefix_to_your_route
  end
  
end
