class SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
      admins_path(resource)
    end
    def after_sign_out_path_for(resource)
      root_path(resource)
    end
end
