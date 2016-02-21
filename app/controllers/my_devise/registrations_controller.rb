class MyDevise::RegistrationsController < Devise::RegistrationsController

    def new
        flash[:info] = 'Registrations are not open.'
        redirect_to root_path
    end

    def after_sign_up_path_for(resource)
      new_profile_path
    end

end