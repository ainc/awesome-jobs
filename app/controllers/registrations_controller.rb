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
      resource.errors.add(:password, t('password_spaces_error'))
      render :edit
    else
      super
    end
  end
end
