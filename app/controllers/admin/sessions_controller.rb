class Admin::SessionsController < Devise::SessionsController
 #before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
    def after_sign_in_path_for(resource)
      admin_panel_path(resource)
    end
    def after_sign_out_path_for(resource)
      root_path(resource)
    end
end
