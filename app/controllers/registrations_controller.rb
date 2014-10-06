class RegistrationsController < Devise::RegistrationsController
  def create
    if !verify_recaptcha
      flash.delete :recaptcha_error
      build_resource(sign_up_params)
      resource.valid?
      resource.errors.add(:base, I18n.t('recaptcha_error'))
      clean_up_passwords(resource)
      render :new
    else
      flash.delete :recaptcha_error
      super
    end
  end

  def update
    if params[:user][:password] and params[:user][:password].length > 0 and params[:user][:password].blank?
      p = account_update_params
      p.delete(:current_password)
      build_resource(p)
      resource.valid?
      clean_up_passwords(resource)
      render :edit
    else
      super
    end
  end
end
