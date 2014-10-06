class SessionsController < Devise::SessionsController

  def new
    
    @disable_alerts = true
    if sign_in_params and sign_in_params[:login]
      u = User.where(["LOWER(username) = :value", { :value => sign_in_params[:login].downcase }]).first
      if u
        @needs_captcha = u.failed_attempts >= User.noncaptcha_attempts
      end
    end
    super
  end

  def create
    u = User.where(["LOWER(username) = :value", { :value => params[:user][:login].downcase }]).first
    if u and u.failed_attempts >= User.noncaptcha_attempts
      if verify_recaptcha
        super
      else
        self.resource = resource_class.new(sign_in_params)
        clean_up_passwords(resource)

        if u.failed_attempts != User.noncaptcha_attempts
          resource.errors.add(:base, t('recaptcha_error'))
        else
          resource.errors.add(:base, t('recaptcha_prompt'))
        end

        @needs_captcha = true

        respond_with_navigational(resource) { render :new }
      end
    else
      super
    end
  end

end
